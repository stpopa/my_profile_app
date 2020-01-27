import 'package:endava_profile_app/modules/common/components/components.dart';
import 'package:flutter/material.dart';

import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnboardingPageLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LoginForm(),
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Button(
              label: 'Continue',
              onPressed: () {
                print('pressed');
              },
            ),
          )
        ],
      ),
    );
  }
}
