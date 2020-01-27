import 'dart:async';

import 'package:endava_profile_app/modules/login/models/login_credentials.dart';

enum LoginEventType { password, email, submit }

class LoginEvent {
  LoginCredentials value;
  LoginEventType type;

  LoginEvent(type, {this.value});
}

class LoginBloc {
  String password = '';
  String email = '';

  StreamController<LoginEvent> _eventSubject =
      StreamController<LoginEvent>.broadcast();
  Sink<LoginEvent> get eventSink => _eventSubject.sink;

  StreamController<LoginCredentials> _loginCredentialSubject =
      StreamController<LoginCredentials>.broadcast();

  Stream<LoginCredentials> get loginCredentiaStream =>
      _loginCredentialSubject.stream;

  LoginBloc() {
    _eventSubject.stream.listen(_onChange);
  }

  _onChange(LoginEvent event) {
    switch (event.type) {
      case LoginEventType.password:
        password = event.value.password;
        break;
      case LoginEventType.email:
        email = event.value.email;
        break;
      case LoginEventType.submit:
        _loginCredentialSubject.add(LoginCredentials());
        print('submit');
    }
  }

  dispose() {
    _eventSubject.close();
    _loginCredentialSubject.close();
  }
}
