import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/data/user_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  @override
  AuthenticationState get initialState => UnauthenticatedState();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      if (await UserRepository.instance.hasToken()) {
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    }

    if (event is LoggedInEvent) {
      UserRepository.instance.persistUserToken(event.token);
      yield AuthenticatedState();
    }

    if (event is LoggedOutEvent) {
      UserRepository.instance.deleteUserToken();
      yield UnauthenticatedState();
    }
  }
}
