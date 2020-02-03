import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/modules/login/bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  @override
  LoginState get initialState => LoginState.initial();

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    print(transition);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield state.copyWith(isEmailValid: true);
    }
    if (event is PasswordChanged) {
      yield state.copyWith(isPasswordValid: true);
    }
    if (event is FormSubmitted) {
      yield state.copyWith(
        isEmailValid: _isEmailValid(event.email),
        isPasswordValid: _isPasswordValid(event.password),
      );
    }
  }

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
