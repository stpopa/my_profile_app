import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';

class MainTheme extends Theme {
  final Widget child;

  MainTheme({this.child}) : super(child: child, data: ThemeData());

  @override
  ThemeData get data => super.data.copyWith(
        scaffoldBackgroundColor: Palette.wildSand,
        accentColor: Palette.cinnabar,
        primaryColorLight: Palette.darkGray,
        primaryColorDark: Colors.black,
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Palette.cinnabar,
            fontWeight: FontWeight.w800,
          ),
          headline5: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          subtitle1: TextStyle(
            color: Palette.darkGray,
            fontWeight: FontWeight.w800,
          ),
          title: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 24.0),
          subtitle: TextStyle(
            color: Palette.gray,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
          body1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          )).apply(fontFamily: 'SFProDisplay'),
      dividerTheme: DividerThemeData(space: 0));
}
