// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textual_achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextualAchievement _$TextualAchievementFromJson(Map<String, dynamic> json) {
  return TextualAchievement(
    title: json['title'] as String,
    hint: json['hint'] as String,
    example: json['example'] as String,
    items: (json['items'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TextualAchievementToJson(TextualAchievement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'hint': instance.hint,
      'example': instance.example,
      'items': instance.items,
    };
