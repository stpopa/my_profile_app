import 'package:endava_profile_app/modules/common/components/slider/level_slider.dart';
import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:endava_profile_app/modules/core_skills/models/skill.dart';
import 'package:flutter/material.dart';

import '../../common/components/confirmation_dialog.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;

  SkillCard({
    @required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Dimens.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.cardBorderRadius,
        ),
      ),
      child: _buildContent(context),
    );
  }

  _buildContent(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.spacingLarge,
          ),
          child: Row(
            children: <Widget>[
              Image.asset(
                skill.icon,
                width: Dimens.skillIconSize,
                height: Dimens.skillIconSize,
              ),
              SizedBox(width: Dimens.spacingLarge),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Dimens.spacingSmall,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              skill.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.close,
                              color: Palette.darkGray,
                              size: Dimens.addIconSize,
                            ),
                            onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  ConfirmationDialog(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    LevelSlider(
                      level: skill.level,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
