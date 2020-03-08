import 'package:flutter/material.dart';

class ProfileAppBar extends SliverAppBar {
  final Color bgColor;

  ProfileAppBar({this.bgColor});

  @override
  bool get pinned => true;

  @override
  Brightness get brightness => Brightness.dark;

  @override
  bool get forceElevated => false;

  @override
  double get elevation => 5;

  @override
  Color get backgroundColor => bgColor ?? super.backgroundColor;

  @override
  Widget get title => FractionallySizedBox(
        widthFactor: 0.28,
        child: Image.asset(
          'assets/images/logo.png',
        ),
      );
}
