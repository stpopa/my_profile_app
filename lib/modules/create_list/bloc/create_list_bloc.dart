import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/services/auth_service.dart';
import 'package:endava_profile_app/services/list_service.dart';
import 'package:endava_profile_app/models/user.dart';
import 'package:endava_profile_app/models/user_list.dart';
import 'package:collection/collection.dart';
import 'package:convert/convert.dart' as convert;
import './bloc.dart';

Function eq = const ListEquality().equals;

class CreateListBloc extends Bloc<CreateListEvent, CreateListState> {
  final authService = AuthService();
  final listService = ListService();

  UserList existingList;
  String name;
  List<User> initialUsers = [];
  List<User> users = [];

  @override
  CreateListState get initialState => CreateListState.initial();

  @override
  void onTransition(Transition<CreateListEvent, CreateListState> transition) {
    print(transition);
  }

  @override
  Stream<CreateListState> mapEventToState(CreateListEvent event) async* {
    if (event is ScreenCreated) {
      if (event.listUniqKey != null) {
        yield Networking();

        existingList = await listService.get(event.listUniqKey);
        _syncWith(existingList);

        yield ListReceived(list: existingList);

        return;
      }

      yield ListReceived(list: UserList(name: name, users: users));
    } else if (event is NameChanged) {
      name = event.name;

      yield ListReceived(
        list: UserList(name: name, users: users),
        hasUnsavedChanges: _hasUnsavedChanges(),
      );
    } else if (event is UserAdded) {
      final userExists =
          users.where((user) => user.uniqKey == event.user.uniqKey).length != 0;

      if (!userExists) users.add(event.user);

      yield ListReceived(
        list: UserList(name: name, users: users),
        hasUnsavedChanges: _hasUnsavedChanges(),
      );
    } else if (event is UserRemoved) {
      users.removeWhere((user) => user.uniqKey == event.user.uniqKey);

      yield ListReceived(
        list: UserList(name: name, users: users),
        hasUnsavedChanges: _hasUnsavedChanges(),
      );
    } else if (event is SavePressed) {
      yield Networking();

      UserList newList;
      if (existingList == null) {
        newList = await listService.create(UserList(name: name, users: users));
      } else {
        newList = await listService.update(
          UserList(
            name: name,
            users: users,
            uniqKey: existingList.uniqKey,
          ),
        );
      }

      final hasChanges = newList != existingList;
      existingList = newList;
      _syncWith(existingList);

      yield ListReceived(
        list: existingList,
        hasChanges: hasChanges,
        hasUnsavedChanges: _hasUnsavedChanges(),
      );
    } else if (event is UserSelected) {
      final index = users.indexOf(event.user);
      users.removeAt(index);
      users.insert(index, event.user.copyWith(selected: !event.user.selected));

      yield ListReceived(
        list: UserList(name: name, users: users),
        hasUnsavedChanges: _hasUnsavedChanges(),
      );
    }
  }

  _syncWith(UserList list) {
    name = list.name;

    initialUsers = List.of(list.users);
    users = List.of(list.users);
  }

  bool _hasUnsavedChanges() {
    return (name != null && name != existingList.name) ||
        !eq(users, initialUsers);
  }
}
