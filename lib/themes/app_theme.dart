import 'package:flutter/material.dart';

class AppTheme extends Theme {
  final Widget child;

  AppTheme({this.child}) : super(child: child, data: ThemeData());

  @override
  ThemeData get data => super.data.copyWith(
      // Progress indicators, appbar title adn actions, avatar border
      primaryColor: Color(0xffDE411B),
      // Progress indicators bg color
      accentColor: Color(0xffF6F6F6),
      scaffoldBackgroundColor: Color(0xffF6F6F6),
      // Card bg color
      primaryColorLight: Colors.white,
      splashColor: Color(0xffF6F6F6),
      textTheme: TextTheme(
        // Separator title ('Design', 'Development')
        display1: TextStyle(
            fontSize: 16, color: Colors.black38, fontWeight: FontWeight.bold),
        // Amount of contributions (Card trailing)
        display2: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        // User name (card title)
        title: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        // User role (card subtitle)
        subtitle: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ));
}
