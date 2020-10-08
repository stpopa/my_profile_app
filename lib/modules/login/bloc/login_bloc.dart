import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/modules/login/bloc/bloc.dart';
import 'package:endava_profile_app/services/auth_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService = AuthService();
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^[A-Za-z\d@$!%*?&]{8,}$',
  );

  @override
  LoginState get initialState => LoginState.initial();

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    print(transition);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is FormSubmitted) {
      if (_isEmailValid(event.email) && _isPasswordValid(event.password)) {
        yield LoginLoading();
        try {
          final token =
              await authService.authenticate(event.email, event.password);

          if (token == null) yield LoginFailure();

          yield LoginSuccess();
        } on InvalidResponseError catch (error) {
          print(error.message);
          yield LoginFailure();
        }
      } else {
        yield LoginState.initial().copyWith(
            isEmailValid: _isEmailValid(event.email),
            isPasswordValid: _isPasswordValid(event.password));
      }
    }
  }

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
