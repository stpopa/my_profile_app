import 'package:bloc/bloc.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

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
      if (await _hasToken()) {
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    }

    if (event is LoggedInEvent) {
      yield AuthenticatedState();
    }

    if (event is LoggedOutEvent) {
      // todo delete token
      yield UnauthenticatedState();
    }
  }

  Future<bool> _hasToken() async {
    return (await FlutterKeychain.get(key: 'authToken') != null);
  }
}
