import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/services/auth_service.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService = AuthService();

  @override
  AuthenticationState get initialState => UnauthenticatedState();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      if (await authService.isAuthenticated()) {
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    }

    if (event is LoggedInEvent) {
      yield AuthenticatedState();
    }

    if (event is LoggedOutEvent) {
      yield UnauthenticatedState();
    }
  }

  Future<bool> _hasToken() async {
    return (await FlutterKeychain.get(key: 'authToken') != null);
  }
}
