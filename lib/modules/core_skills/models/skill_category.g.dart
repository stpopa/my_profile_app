// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillCategory _$SkillCategoryFromJson(Map<String, dynamic> json) {
  return SkillCategory(
    id: json['id'] as int,
    title: json['title'] as String,
    skills: (json['skills'] as List)
        ?.map(
            (e) => e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SkillCategoryToJson(SkillCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'skills': instance.skills,
    };
