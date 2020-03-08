import 'package:endava_profile_app/themes/main_theme.dart';
import 'package:flutter/material.dart';

import 'package:endava_profile_app/modules/login/components/components.dart';

class OnboardingPageLayout extends StatelessWidget {
  final Widget child;

  OnboardingPageLayout({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainTheme(
        child: Stack(
          children: <Widget>[
            HeaderShape(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: child,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
