import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {

  final Function(String) onMailChanged;
  final Function(String) onPasswordChanged;

  LoginForm({this.onMailChanged, this.onPasswordChanged});

  @override
  Widget build(BuildContext context) {

    return Container(
          child: Column(children: <Widget>[
            TextFormField(
              textAlignVertical: TextAlignVertical(y: 0),
              style: Theme.of(context).textTheme.body2,
              validator: (value) {
                if (!_validateEmail(value)) {
                  return 'wrong format';
                }
                return null;
              },
              onChanged: onMailChanged,
              decoration: InputDecoration(
                  hintText: 'Email address',
                  hintStyle: Theme.of(context).textTheme.body1),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
                textAlignVertical: TextAlignVertical(y: 0),
                style: Theme.of(context).textTheme.body2,
                obscureText: true,
                validator: (value) {
                  if (!_validatePassword(value)) {
                    return 'wrong format';
                  }
                  return null;
                },
                onChanged: onPasswordChanged,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: Theme.of(context).textTheme.body1)),
          ]),
        );
  }

  bool _validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool _validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
