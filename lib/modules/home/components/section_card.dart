import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/home/components/content/portfolio_content.dart';
import 'package:endava_profile_app/modules/home/components/content/section_content.dart';
import 'package:endava_profile_app/modules/home/components/content/skills_content.dart';
import 'package:endava_profile_app/modules/home/components/content/user_content.dart';
import 'package:endava_profile_app/modules/home/models/content_item.dart';
import 'package:endava_profile_app/modules/home/models/section_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'section_placeholder.dart';

class SectionCard extends StatelessWidget {
  final SectionListItem section;
  final Function(String key) onTap;

  SectionCard({
    @required this.onTap,
    @required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(section.key),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: Dimens.sectionCardHeight,
          child: _buildContent(),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset.zero,
                    blurRadius: 3,
                    spreadRadius: 3)
              ]),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (section is ContentItem) {
      return SectionContent(content: section);
    } else if (section is UserItem) {
      return UserContent(item: section);
    } else if (section is SkillsItem) {
      return SkillsContent(content: section);
    } else if (section is PortfolioItem) {
      return PortfolioContent(content: section);
    } else {
      return SectionPlaceholder(placeholder: section);
    }
  }
}
