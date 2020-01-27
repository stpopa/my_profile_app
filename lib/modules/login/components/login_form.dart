import 'package:endava_profile_app/modules/common/components/components.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextInput(
          hintText: 'Email address',
        ),
        SizedBox(height: 20.0),
        TextInput(
          hintText: 'Password',
          obscureText: true,
        ),
      ],
    );
  }
}
