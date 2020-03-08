import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/data/user_repository.dart';
import 'package:flutter/cupertino.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository});

  @override
  AuthenticationState get initialState => UnauthenticatedState();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      if (await userRepository.hasToken()) {
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    }

    if (event is LoggedInEvent) {
      // todo persist token
      print('persisting token ${event.token}');
      yield AuthenticatedState();
    }

    if (event is LoggedOutEvent) {
      // todo delete token
      yield UnauthenticatedState();
    }
  }
}
