import 'package:endava_profile_app/modules/core_skills/models/skill.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skill_category.g.dart';

@JsonSerializable()
class SkillCategory {
  final int id;
  final String title;
  final List<Skill> skills;

  const SkillCategory({
    this.id,
    this.title,
    this.skills,
  });

  SkillCategory copyWith({
    List<Skill> skills,
  }) {
    return SkillCategory(
      id: id,
      title: title,
      skills: skills ?? this.skills,
    );
  }

  factory SkillCategory.fromJson(Map<String, dynamic> json) =>
      _$SkillCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SkillCategoryToJson(this);
}
