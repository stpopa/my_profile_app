import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:flutter/material.dart';

class FilledCircleIcon extends StatelessWidget {
  final Widget icon;
  final Color color;

  FilledCircleIcon({@required this.icon, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.default_icon_size,
      height: Dimens.default_icon_size,
      child: icon,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
