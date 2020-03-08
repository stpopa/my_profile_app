import 'section_list_item.dart';
import '../../../models/user.dart';

class ContentItem implements SectionListItem {
  String key;
  final String title;
  final String icon;
  final String value;

  ContentItem({this.key, this.value, this.title, this.icon});
}

class UserItem implements SectionListItem {
  String key;
  final User user;

  UserItem({this.key, this.user});
}

class SkillsItem implements SectionListItem {
  String key;
  final String title;
  final String icon;
  final List<dynamic> skills;

  SkillsItem({this.key, this.skills, this.title, this.icon});
}

class PortfolioItem implements SectionListItem {
  String key;
  final String title;
  final String icon;
  final String value;

  PortfolioItem({this.key, this.value, this.title, this.icon});
}

