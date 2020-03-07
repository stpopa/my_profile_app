import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.add,
            color: Palette.darkGray,
            size: Dimens.addIconSize,
          ),
          Text(
            'Add new',
            style: Theme.of(context).textTheme.headline.copyWith(
                  color: Palette.darkGray,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.fontSizeNormal,
                ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
