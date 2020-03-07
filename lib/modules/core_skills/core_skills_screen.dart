import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:flutter/material.dart';

import '../common/components/toolbar.dart';
import 'components/skill_section.dart';
import 'components/tab_section.dart';
import 'models/skill_category.dart';

class CoreSkillsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> tabs = _generateTabs();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Palette.wildSand,
        appBar: Toolbar(
          bottom: TabSection(tabs: tabs),
        ),
        body: TabBarView(
          children: List.generate(tabs.length, _buildSection),
        ),
      ),
    );
  }

  _generateTabs() {
    return List<String>.from(['All'])
      ..addAll(categories.map((category) => category.title));
  }

  Widget _buildSection(int index) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingSmall,
          vertical: Dimens.spacingSmall,
        ),
        child: _buildContent(index),
      ),
    );
  }

  _buildContent(int index) {
    if (index == 0) {
      return Column(
        children: categories
            .map(
              (category) => SkillSection(
                category: category,
                isHeaderVisible: true,
              ),
            )
            .toList(),
      );
    }

    return SkillSection(
      category: categories.elementAt(index - 1),
    );
  }
}
