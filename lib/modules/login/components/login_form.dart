import 'package:endava_profile_app/modules/common/components/components.dart';
import 'package:endava_profile_app/modules/common/components/constants.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function(String) onMailChanged;
  final Function(String) onPasswordChanged;

  LoginForm({this.formKey, this.onMailChanged, this.onPasswordChanged});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextInput(
              hintText: Constants.of(context).emailPlaceholder,
              validator: (value) {
                if (!_validate(value, Constants.of(context).emailRegExp)) {
                  return Constants.of(context).formError;
                }
                return null;
              },
              onChanged: onMailChanged,
            ),
            SizedBox(height: 20.0),
            TextInput(
              hintText: Constants.of(context).passwordPlaceholder,
              obscureText: true,
              validator: (value) {
                if (!_validate(value, Constants.of(context).passwordRegExp)) {
                  return Constants.of(context).formError;
                }
                return null;
              },
              onChanged: onPasswordChanged,
            ),
          ],
        ));
  }

  bool _validate(String value, String pattern) {
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
