import '../../../models/user.dart';
import 'section_list_item.dart';

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

class DomainExperienceItem implements SectionListItem {
  String key;
  final String title;
  final String icon;
  final String value;

  DomainExperienceItem({this.key, this.title, this.icon, this.value});
}

class PortfolioItem implements SectionListItem {
  String key;
  final String title;
  final String icon;
  final String value;

  PortfolioItem({this.key, this.value, this.title, this.icon});
}
