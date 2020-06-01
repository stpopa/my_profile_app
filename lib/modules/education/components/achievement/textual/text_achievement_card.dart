import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/modules/common/components/filled_circle_icon.dart';
import 'package:endava_profile_app/modules/education/components/achievement/base_achievement_card_state.dart';
import 'package:endava_profile_app/modules/education/components/achievement/textual/multiline_text_field.dart';
import 'package:endava_profile_app/modules/education/models/textual_achievement.dart';
import 'package:flutter/material.dart';

class TextAchievementCard extends StatefulWidget {
  final TextualAchievement data;
  final Function(TextualAchievement) onDataChanged;

  TextAchievementCard({@required this.data, @required this.onDataChanged});

  @override
  _TextAchievementCardState createState() => _TextAchievementCardState();
}

class _TextAchievementCardState extends BaseAchievementCardState<TextAchievementCard> {
  List<String> items = List();
  bool isAddNewSelected = false;
  String newItem = "";
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.data.items != null && widget.data.items.isNotEmpty) {
      items = widget.data.items;
    }
  }

  @override
  List<Widget> getChildrenContent() {
    return [
      getHeader(widget.data.title),
      getItemsList(items),
      _getItemTextField(),
      getAddNewItemButton(),
    ];
  }

  @override
  Widget createListItem(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
            fit: FlexFit.loose,
            child: Text(items[index], style: TextStyle(fontSize: Dimens.fontSizeLarge, color: Colors.black))),
        InkWell(
            child: FilledCircleIcon(icon: Icon(Icons.remove, color: Colors.white), color: Palette.suvaGrey),
            onTap: () {
              setState(() => items.removeAt(index));
              onDataChanged("item removed");
            }),
      ],
    );
  }

  @override
  GestureTapCallback onAddNewItemCallback() {
    return () {
      setState(() {
        if (newItem.isNotEmpty) {
          items.add(newItem);
          newItem = "";
          textEditingController.text = "";
        }
        isAddNewSelected = true;
      });
      onDataChanged("item added");
    };
  }

  Widget _getItemTextField() {
    return items.isEmpty || isAddNewSelected
        ? Padding(
            padding: const EdgeInsets.only(bottom: Dimens.spacingMedium),
            child: MultilineCustomTextField(
              hint: widget.data.hint ?? "",
              controller: textEditingController,
              onChange: (newText) {
                newItem = newText;
                onDataChanged("text changed");
              },
            ))
        : Container();
  }

  void onDataChanged([String log]) {
    var currentItems = List<String>();
    currentItems.addAll(items);
    if (newItem.isNotEmpty) {
      currentItems.add(newItem);
    }
    widget.onDataChanged(widget.data.cloneWith(currentItems));
  }
}
