import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/themes/icons/profile_app_custom_icons.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryExampleExpandable extends StatelessWidget {
  final exampleTitle;
  final exampleText;

  const CategoryExampleExpandable(
      {Key key, this.exampleTitle, this.exampleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          indent: Dimens.spacingMedium,
          endIndent: Dimens.spacingMedium,
        ),
        ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.fromLTRB(
              Dimens.spacingMedium,
              Dimens.spacingLarge,
              Dimens.spacingMedium,
              Dimens.spacingLarge,
            ),
            child: Row(
              children: <Widget>[
                ImageIcon(
                  AssetImage('assets/images/quote-icon.png'),
                  color: Palette.cinnabar,
                  size: 28,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      Dimens.spacingMedium, 0.0, Dimens.spacingMedium, 0.0),
                  child: Text(
                    exampleTitle,
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          theme: ExpandableThemeData(
              iconPadding: EdgeInsets.fromLTRB(
                  Dimens.spacingLarge, 22.0, Dimens.spacingMedium, 22.0),
              iconSize: 24.0,
              expandIcon: ProfileAppIcons.expand_icon,
              collapseIcon: ProfileAppIcons.expand_icon,
              iconColor: Palette.cinnabar),
          expanded: Padding(
              padding: const EdgeInsets.fromLTRB(Dimens.spacingXHuge, 0.0,
                  Dimens.spacingXSmall, Dimens.spacingLarge),
              child: Text(
                exampleText,
                style: Theme.of(context).textTheme.subtitle.copyWith(
                    fontSize: Dimens.fontSizeMedium, color: Palette.grayBlack),
              )),
        ),
        Divider(
          indent: Dimens.spacingMedium,
          endIndent: Dimens.spacingMedium,
        ),
      ],
    );
  }
}
