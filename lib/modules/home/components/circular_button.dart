import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CircularButton({
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: Dimens.circularButtonHeight,
      shape: CircleBorder(),
      elevation: 0.0,
      color: Palette.cinnabar,
      disabledColor: Palette.gainsboro,
      child: Icon(
        icon,
        color: Colors.white,
        size: Dimens.circularButtonIconSize,
      ),
      onPressed: onPressed,
    );
  }
}
