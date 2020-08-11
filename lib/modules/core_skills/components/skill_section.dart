import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/core_skills/components/add_button.dart';
import 'package:endava_profile_app/modules/core_skills/models/skill.dart';
import 'package:endava_profile_app/modules/core_skills/models/skill_category.dart';
import 'package:flutter/material.dart';

import 'skill_card.dart';

class SkillSection extends StatefulWidget {
  final SkillCategory category;
  final bool isHeaderVisible;

  SkillSection({
    @required this.category,
    this.isHeaderVisible = false,
  });

  @override
  _SkillSectionState createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.isHeaderVisible) ...[
          _buildHeader(context),
        ],
        ...widget.category.skills.map(_buildContent),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.spacingXSmall),
          child: AddButton(),
        ),
      ],
    );
  }

  _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.spacingTiny,
        right: Dimens.spacingTiny,
        top: Dimens.spacingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.category.title,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: Dimens.spacingXSmall),
          Text(
            '${widget.category.skills.length} skills',
            style: Theme.of(context).textTheme.subhead.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.fontSizeNormal,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Skill skill) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.spacingTiny),
      child: SkillCard(skill: skill),
    );
  }
}
