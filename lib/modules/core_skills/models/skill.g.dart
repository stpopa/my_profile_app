// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) {
  return Skill(
    id: json['id'] as int,
    title: json['title'] as String,
    icon: json['icon'] as String,
    level: json['level'] as int,
  );
}

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
      'level': instance.level,
    };
