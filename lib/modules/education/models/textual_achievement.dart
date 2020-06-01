import 'package:json_annotation/json_annotation.dart';

part 'textual_achievement.g.dart';

class BaseAchievement {}

@JsonSerializable(nullable: true)
class TextualAchievement extends BaseAchievement {
  final String title;
  final String hint;
  final String example;
  final List<String> items;

  TextualAchievement({this.title, this.hint, this.example, this.items}) : super();

  factory TextualAchievement.fromJson(Map<String, dynamic> json) => _$TextualAchievementFromJson(json);

  Map<String, dynamic> toJson() => _$TextualAchievementToJson(this);

  TextualAchievement cloneWith(List<String> items) {
    return TextualAchievement(title: this.title, hint: this.hint, example: this.example, items: items);
  }
}
