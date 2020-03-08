import 'section_list_item.dart';

class PlaceholderItem implements SectionListItem {
  String key;
  final String title;
  final String icon;

  PlaceholderItem({
    this.key,
    this.title,
    this.icon,
  });
}
