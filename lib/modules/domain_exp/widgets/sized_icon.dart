import 'package:flutter/material.dart';

class SizedIcon extends StatelessWidget {
  static const _DEFAULT_ICON_SIZE = 24.0;

  final double size;
  final String assetPath;

  SizedIcon.asset(
    this.assetPath, {
    this.size = _DEFAULT_ICON_SIZE,
  });

  SizedIcon({
    this.assetPath,
    this.size = _DEFAULT_ICON_SIZE,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Image.asset(assetPath),
    );
  }
}
