import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:endava_profile_app/modules/home/components/progress_bar.dart';
import 'package:endava_profile_app/modules/home/models/section_list_item.dart';
import 'package:flutter/material.dart';

import 'components/section_card.dart';
import 'models/content_item.dart';
import 'models/placeholder_item.dart';
import '../common/components/flutter_team.dart';

class HomeScreen extends StatelessWidget {
  final List<ContentItem> contentItems = [
//    ContentItem(
//      key: 'experience',
//      value: 'Content',
//    ),
//    ContentItem(
//      key: 'portfolio',
//      value: 'Content',
//    ),
  ];

  final List<PlaceholderItem> placeholders = [
    PlaceholderItem(
      key: 'user',
      title: 'Name and role',
      icon: 'assets/images/user.png',
    ),
    PlaceholderItem(
      key: 'summary',
      title: 'Summary',
      icon: 'assets/images/summary.png',
    ),
    PlaceholderItem(
      key: 'experience',
      title: 'Domain experience',
      icon: 'assets/images/experience.png',
    ),
    PlaceholderItem(
      key: 'skills',
      title: 'Core skills',
      icon: 'assets/images/skills.png',
    ),
    PlaceholderItem(
      key: 'education',
      title: 'Education and training',
      icon: 'assets/images/education.png',
    ),
    PlaceholderItem(
      key: 'portfolio',
      title: 'Professional experience',
      icon: 'assets/images/portfolio.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var sections = _getSections();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
            pinned: true,
            forceElevated: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 5,
            title: FractionallySizedBox(
              widthFactor: 0.28,
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, Dimens.spacingLarge, 0, 0),
              child: Center(
                child: ProgressBar(
                  percent: 0.5,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SectionCard(section: sections[index]);
              },
              childCount: sections.length,
              semanticIndexOffset: 2,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: FlutterTeam(
              onTap: () {
                Navigator.of(context).pushNamed('/contributors');
              },
            ),
          ),
        ],
      ),
    );
  }

  List<SectionListItem> _getSections() => placeholders
      .map((placeholder) => _getContentByKey(placeholder.key) ?? placeholder)
      .toList();

  ContentItem _getContentByKey(String key) => contentItems.firstWhere(
        (item) => item.key == key,
        orElse: () => null,
      );
}
