import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/modules/common/components/circle_image.dart';
import 'package:endava_profile_app/modules/common/components/draggable_progress_widget.dart';
import 'package:endava_profile_app/modules/education/models/progressable_achievement.dart';
import 'package:flutter/material.dart';

class ProgressSkillCard extends StatefulWidget {
  final ProgressableItem data;
  final Function(ProgressableItem) onNewLevelSelected;

  ProgressSkillCard({@required this.data, @required this.onNewLevelSelected});

  @override
  _ProgressSkillCardState createState() => _ProgressSkillCardState();
}

class _ProgressSkillCardState extends State<ProgressSkillCard> {
  String knowledgeLevelName;

  @override
  void initState() {
    super.initState();
    knowledgeLevelName = widget.data.levels[widget.data.selectedLevel];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Dimens.defaultElevation,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.spacingXSmall)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Dimens.spacingXLarge, 0, Dimens.spacingLarge, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleNetworkImage(url: widget.data.image, size: Dimens.skill_icon_size),
            SizedBox(width: Dimens.spacingXLarge),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: Dimens.spacingSmall,),
                    Text(
                      widget.data.name,
                      style: TextStyle(
                          fontSize: Dimens.fontSizeXLarge, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      knowledgeLevelName,
                      style: TextStyle(fontSize: Dimens.fontSizeMedium, color: Palette.darkGray),
                    ),
                    SizedBox(height: Dimens.spacingXSmall),
                    DraggableProgress(widget.data.levels, widget.data.selectedLevel, (newLevel) {
                      setState(() {
                        knowledgeLevelName = newLevel;
                      });
                      onDataChanged();
                    }),
                    SizedBox(height: Dimens.spacingSmall),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onDataChanged() {
    widget.onNewLevelSelected(widget.data.cloneWith(widget.data.levels.indexOf(knowledgeLevelName)));
  }
}
