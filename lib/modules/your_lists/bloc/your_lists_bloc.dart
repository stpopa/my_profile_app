import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/services/list_service.dart';
import 'package:endava_profile_app/models/user_list.dart';
import 'package:share/share.dart';
import './bloc.dart';

class YourListsBloc extends Bloc<YourListsEvent, YourListsState> {
  final listService = ListService();

  List<UserList> userLists;

  @override
  YourListsState get initialState => YourListsState.initial();

  @override
  void onTransition(Transition<YourListsEvent, YourListsState> transition) {
    print(transition);
  }

  @override
  Stream<YourListsState> mapEventToState(YourListsEvent event) async* {
    print(event);
    if (event is ScreenCreatedEvent) {
      yield Networking();

      userLists = await listService.showAll();

      yield ListReceived(userLists: userLists);
    } else if (event is RemoveListEvent) {
      yield Networking();

      userLists.remove(event.userList);
      await listService.destroy(event.userList);

      yield ListReceived(userLists: userLists);
    } else if (event is ShareListEvent) {
      Share.share(
        listService.getShareUrl(event.userList),
        subject: "Send this link to the client",
      );
    }
  }
}
