import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';

class CircleNetworkImage extends StatelessWidget {
  final String url;
  final double size;

  const CircleNetworkImage({Key key, this.url, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.skill_icon_size),
      child: Image.network(
        url,
        width: size,
        height: size,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
