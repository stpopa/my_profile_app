import 'package:endava_profile_app/modules/common/components/components.dart';
import 'package:endava_profile_app/modules/login/login_bloc.dart';
import 'package:endava_profile_app/modules/login/models/login_credentials.dart';
import 'package:flutter/material.dart';
import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    LoginBloc bloc = LoginBloc();

    return OnboardingPageLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LoginForm(
            formKey: _formKey,
            onMailChanged: (email) {
              print(email);
              final event = LoginEvent(LoginEventType.email,
                  value: LoginCredentials(email: email));
              bloc.eventSink.add(event);
            },
            onPasswordChanged: (password) {
              final event = LoginEvent(LoginEventType.password,
                  value: LoginCredentials(password: password));
              bloc.eventSink.add(event);
            },
          ),
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Button(
              label: 'Continue',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final event = LoginEvent(LoginEventType.submit);
                  bloc.eventSink.add(event);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
