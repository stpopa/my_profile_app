// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progressable_achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressableAchievement _$ProgressableAchievementFromJson(
    Map<String, dynamic> json) {
  return ProgressableAchievement(
    title: json['title'] as String,
    example: json['example'] as String,
    items: (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : ProgressableItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProgressableAchievementToJson(
        ProgressableAchievement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'example': instance.example,
      'items': instance.items,
    };

ProgressableItem _$ProgressableItemFromJson(Map<String, dynamic> json) {
  return ProgressableItem(
    name: json['name'] as String,
    image: json['image'] as String,
    levels: (json['levels'] as List)?.map((e) => e as String)?.toList(),
    selectedLevel: json['selectedLevel'] as int,
  );
}

Map<String, dynamic> _$ProgressableItemToJson(ProgressableItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'levels': instance.levels,
      'selectedLevel': instance.selectedLevel,
    };
