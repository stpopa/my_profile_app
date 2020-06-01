import 'package:endava_profile_app/modules/education/models/progressable_achievement.dart';
import 'package:endava_profile_app/modules/education/models/textual_achievement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'achievements.g.dart';

@JsonSerializable(nullable: true)
class Achievements {
  final TextualAchievement qualifications;
  final TextualAchievement certificates;
  final ProgressableAchievement languages;

  Achievements({this.qualifications, this.certificates, this.languages}) : super();

  factory Achievements.fromJson(Map<String, dynamic> json) => _$AchievementsFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementsToJson(this);

  bool hasData() {
    return certificates != null && qualifications != null && languages != null;
  }
}
