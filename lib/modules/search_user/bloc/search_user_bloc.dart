import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/services/auth_service.dart';
import 'package:endava_profile_app/models/user.dart';
import './bloc.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  final authService = AuthService();

  List<User> users;

  @override
  SearchUserState get initialState => SearchUserState.initial();

  @override
  Stream<SearchUserState> mapEventToState(SearchUserEvent event) async* {
    if (event is SearchStringChanged) {
      yield Networking();
      print(event.searchString);
      users = await authService.search(event.searchString);
      print('success');
      print(users);
      yield UsersReceived(users: users);
    }
  }
}
