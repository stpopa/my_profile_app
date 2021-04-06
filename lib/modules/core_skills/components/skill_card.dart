import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/modules/common/components/slider/level_slider.dart';
import 'package:endava_profile_app/modules/core_skills/bloc/bloc.dart';
import 'package:endava_profile_app/models/skill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/confirmation_dialog.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;

  SkillCard({@required this.skill});

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  SkillsBloc _skillsBloc;

  @override
  void initState() {
    super.initState();

    _skillsBloc = BlocProvider.of<SkillsBloc>(context);
  }

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
              Image.network(
                widget.skill.icon,
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
                              widget.skill.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
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
                                  ConfirmationDialog(
                                onConfirmPressed: _onSkillDeletePressed,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    LevelSlider(
                      level: widget.skill.level,
                      onSkillUpdatePressed: onSkillUpdatePressed,
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

  void _onSkillDeletePressed() {
    _skillsBloc.add(
      Delete(skillId: widget.skill.id),
    );
  }

  void onSkillUpdatePressed(int selectedLevel) {
    _skillsBloc.add(
      Update(
        skillId: widget.skill.id,
        skillLevel: selectedLevel,
      ),
    );
  }
}
