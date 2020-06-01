import 'package:endava_profile_app/modules/education/models/textual_achievement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'progressable_achievement.g.dart';

@JsonSerializable(nullable: true)
class ProgressableAchievement extends BaseAchievement {
  final String title;
  final String example;
  final List<ProgressableItem> items;

  ProgressableAchievement({this.title, this.example, this.items}) : super();

  factory ProgressableAchievement.fromJson(Map<String, dynamic> json) => _$ProgressableAchievementFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressableAchievementToJson(this);

  ProgressableAchievement cloneWith(List<ProgressableItem> items) {
    return ProgressableAchievement(title: this.title, example: this.example, items: items);
  }
}

@JsonSerializable(nullable: true)
class ProgressableItem {
  final String name;
  final String image;
  final List<String> levels;
  final int selectedLevel;

  ProgressableItem({this.name, this.image, this.levels, this.selectedLevel});

  factory ProgressableItem.fromJson(Map<String, dynamic> json) => _$ProgressableItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressableItemToJson(this);

  ProgressableItem cloneWith(int selectedLevel) {
    return ProgressableItem(
       name: this.name, image: this.image, levels: this.levels, selectedLevel: selectedLevel);
  }
}
