import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';

class HeaderShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: MediaQuery.of(context).size.height / 1.8,
      decoration: BoxDecoration(
        color: Palette.wildSand,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(350),
          bottomRight: Radius.circular(350),
        ),
      ),
    );
  }
}
