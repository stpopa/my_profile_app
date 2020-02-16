import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:endava_profile_app/modules/home/models/section_list_item.dart';
import 'package:flutter/material.dart';

import 'components/section_card.dart';
import 'models/content_item.dart';
import 'models/placeholder_item.dart';

class HomeScreen extends StatelessWidget {
  final List<ContentItem> contentItems = [
    ContentItem(
      key: 'experience',
      value: 'Content',
    ),
    ContentItem(
      key: 'portfolio',
      value: 'Content',
    ),
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.wildSand,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              Dimens.spacingSmall,
            ),
            child: Column(
              children: <Widget>[
                ...sections.map(
                  (section) => SectionCard(
                    section: section,
                  ),
                ),
              ],
            ),
          ),
        ),
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
