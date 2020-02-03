import 'package:endava_profile_app/modules/contributors/contributors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/login/login_screen.dart';

void main() {
  runApp(EndavaProfileApp());
}

class EndavaProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Endava Profile',
      initialRoute: '/login',
      routes: {
        '/': (c) => ContributorsScreen(repository: 'stpopa/endava_profile_app'),
        '/login': (c) => LoginScreen(),
      },
    );
  }
}
