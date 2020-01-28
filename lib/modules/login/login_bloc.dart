import 'dart:async';
import 'package:endava_profile_app/modules/login/models/login_credentials.dart';

enum LoginEventType { password, email, submit }

class LoginEvent {
  LoginEventType type;
  LoginCredentials value;

  LoginEvent(this.type, {this.value});
}

class LoginBloc {
  String password = '';
  String email = '';

  StreamController<LoginEvent> _eventSubject =
      StreamController<LoginEvent>.broadcast();
  Sink<LoginEvent> get eventSink => _eventSubject.sink;

  LoginBloc() {
    _eventSubject.stream.listen(_onEvent);
  }

  _onEvent(LoginEvent event) {
    switch (event.type) {
      case LoginEventType.password:
        password = event.value.password;
        break;
      case LoginEventType.email:
        email = event.value.email;
        break;
      case LoginEventType.submit:
        print(email);
        print(password);
    }
  }

  dispose() {
    _eventSubject.close();
  }
}
