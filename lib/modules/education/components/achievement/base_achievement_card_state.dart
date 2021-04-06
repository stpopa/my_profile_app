import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';

abstract class BaseAchievementCardState<T extends StatefulWidget> extends State<T> {
  List<Widget> getChildrenContent();

  Widget createListItem(BuildContext context, int index);

  GestureTapCallback onAddNewItemCallback();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Dimens.spacingSmall, Dimens.spacingLarge, Dimens.spacingSmall, Dimens.spacingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: getChildrenContent(),
      ),
    );
  }

  Widget getHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.spacingMedium),
      child: Text(title,
          style: TextStyle(fontSize: Dimens.fontSizeXLarge, color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }

  Widget getItemsList(List items) {
    return items != null && items.isNotEmpty
        ? ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: Dimens.spacingSmall),
                child: createListItem(context, index),
              );
            },
          )
        : Container();
  }

  Widget getAddNewItemButton() {
    return InkWell(
      onTap: onAddNewItemCallback(),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.add,
            color: Palette.gray,
            size: Dimens.default_icon_size,
          ),
          Text("Add new", style: TextStyle(fontSize: Dimens.fontSizeLarge, color: Palette.gray))
        ],
      ),
    );
  }
}
