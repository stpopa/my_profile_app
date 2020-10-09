import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'components/skill_section.dart';
import 'components/tab_section.dart';
import 'components/toolbar.dart';
import 'models/skill_category.dart';

class CoreSkillsContent extends StatefulWidget {
  @override
  _CoreSkillsContentState createState() => _CoreSkillsContentState();
}

class _CoreSkillsContentState extends State<CoreSkillsContent> {
  SkillsBloc _skillsBloc;

  @override
  void initState() {
    super.initState();

    _skillsBloc = BlocProvider.of<SkillsBloc>(context);
    _skillsBloc.add(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsBloc, SkillsState>(
      builder: (context, state) {
        if (state is Failure) {
          return Center(child: Text('Something went wrong...'));
        }

        if (state is Loaded) {
          List<String> tabs = _generateTabs(state.categories);

          return DefaultTabController(
            length: tabs.length,
            child: Scaffold(
              backgroundColor: Palette.wildSand,
              appBar: Toolbar(
                bottom: TabSection(tabs: tabs),
              ),
              body: TabBarView(
                children: List.generate(tabs.length,
                    (index) => _buildSection(index, state.categories)),
              ),
            ),
          );
        }

        return Container(
          color: Palette.wildSand,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Palette.cinnabar),
              strokeWidth: 6,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _skillsBloc.close();
  }

  _generateTabs(List<SkillCategory> categories) {
    return List<String>.from(['All'])
      ..addAll(categories.map((category) => category.title));
  }

  Widget _buildSection(int index, List<SkillCategory> categories) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingSmall,
          vertical: Dimens.spacingSmall,
        ),
        child: _buildContent(index, categories),
      ),
    );
  }

  _buildContent(int index, List<SkillCategory> categories) {
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
