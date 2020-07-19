import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:flutter/material.dart';

class TabSection extends StatelessWidget implements PreferredSizeWidget {
  final List<String> tabs;

  TabSection({@required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimens.spacingSmall,
        bottom: Dimens.spacingLarge,
      ),
      child: TabBar(
        isScrollable: true,
        indicatorColor: Palette.cinnabar,
        labelColor: Palette.black,
        unselectedLabelColor: Palette.darkGray,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Dimens.fontSizeMedium,
        ),
        labelPadding: EdgeInsets.only(
          bottom: Dimens.spacingTiny,
          left: Dimens.spacingLarge,
          right: Dimens.spacingLarge,
        ),
        tabs: tabs.map((tab) => Text(tab)).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => null;
}
