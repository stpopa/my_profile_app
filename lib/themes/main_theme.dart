import 'package:endava_profile_app/modules/common/constants/palette.dart';
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
          display2: TextStyle(
            color: Palette.cinnabar,
            fontWeight: FontWeight.w800,
          ),
          headline: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          subhead: TextStyle(
            color: Palette.darkGray,
            fontWeight: FontWeight.w800,
          ),
        ).apply(fontFamily: 'SFProDisplay'),
      );
}
