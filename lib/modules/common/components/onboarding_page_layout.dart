import 'package:flutter/material.dart';

import 'components.dart';

class OnboardingPageLayout extends StatelessWidget {
  final Widget child;

  OnboardingPageLayout({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    child: Logo(),
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
    );
  }
}
