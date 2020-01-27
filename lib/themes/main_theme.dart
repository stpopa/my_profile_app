import 'package:flutter/material.dart';

class MainTheme extends Theme {
  final Widget child;

  MainTheme({this.child}) : super(child: child, data: ThemeData());

  @override
  ThemeData get data => super.data.copyWith(
        primaryColor: Color(0xffDE411B),
        buttonColor: Color(0xffDE411B),
        textTheme: TextTheme(
          subtitle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          title: TextStyle(
            color: Color.fromRGBO(222, 65, 27, 1),
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
          body1: TextStyle(
            color: Color.fromRGBO(178, 178, 178, 1),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          body2: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.normal,
          )
        ),
      );
}
