import 'package:endava_profile_app/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'modules/contributors/contributors_screen.dart';

void main() {
  runApp(EndavaProfileApp());
}

class EndavaProfileApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endava Profile',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (c) => LoginScreen(),
        '/contributors': (c) => ContributorsScreen(repository: 'stpopa/endava_profile_app'),
      },
    );
  }
}
