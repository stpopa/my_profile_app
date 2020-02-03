import 'package:flutter/material.dart';

class MainTheme extends Theme {
  final Widget child;

  MainTheme({this.child}) : super(child: child, data: ThemeData());

  @override
  ThemeData get data => super.data.copyWith(
        scaffoldBackgroundColor: Colors.white,
        accentColor: Color(0xffDE411B),
        primaryColorLight: Color.fromARGB(255, 178, 178, 178),
        primaryColorDark: Colors.black,
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
        ).apply(fontFamily: 'SFProDisplay'),
      );
}
