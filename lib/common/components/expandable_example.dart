import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/themes/icons/profile_app_custom_icons.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableExample extends StatelessWidget {
  final String title;
  final Widget child;

  const ExpandableExample({Key key, this.title, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(
              Dimens.spacingMedium, 15, Dimens.spacingMedium, 0),
          height: 1,
          color: Palette.darkGray.withAlpha(180),
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
                    Dimens.spacingMedium,
                    0.0,
                    Dimens.spacingMedium,
                    0.0,
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          theme: ExpandableThemeData(
            iconPadding: EdgeInsets.fromLTRB(
              Dimens.spacingLarge,
              22.0,
              Dimens.spacingLarge,
              22.0,
            ),
            iconSize: 24.0,
            expandIcon: ProfileAppIcons.expand_icon,
            collapseIcon: ProfileAppIcons.expand_icon,
            iconColor: Palette.cinnabar,
          ),
          expanded: Padding(
            padding: const EdgeInsets.fromLTRB(Dimens.spacingXHuge, 0.0,
                Dimens.spacingXSmall, Dimens.spacingLarge),
            child: child,
          ),
        ),
        Container(
          margin:
              EdgeInsets.fromLTRB(Dimens.spacingMedium, 0, Dimens.spacingMedium, 0),
          height: 1,
          color: Palette.darkGray.withAlpha(180),
        ),
      ],
    );
  }
}
