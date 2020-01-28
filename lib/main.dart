import 'package:endava_profile_app/modules/common/components/constants.dart';
import 'package:endava_profile_app/modules/contributors/contributors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/login/login_screen.dart';

void main() {
  runApp(Constants(child: EndavaProfileApp()));
}

class EndavaProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Endava Profile',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        accentColor: Color(0xffDE411B),
        primaryColorLight: Color.fromARGB(255, 178, 178, 178),
        primaryColorDark: Colors.black,
        fontFamily: 'SFProDisplay',
        textTheme: TextTheme(
          display2: TextStyle(
            color: Color(0xffDE411B),
            fontWeight: FontWeight.w800,
          ),
          headline: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          subhead: TextStyle(
            color: Color.fromARGB(255, 178, 178, 178),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/': (c) => ContributorsScreen(repository: 'stpopa/endava_profile_app'),
        '/login': (c) => LoginScreen(),
      },
    );
  }
}
