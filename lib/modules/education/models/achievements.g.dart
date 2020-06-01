// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Achievements _$AchievementsFromJson(Map<String, dynamic> json) {
  return Achievements(
    qualifications: json['qualifications'] == null
        ? null
        : TextualAchievement.fromJson(
            json['qualifications'] as Map<String, dynamic>),
    certificates: json['certificates'] == null
        ? null
        : TextualAchievement.fromJson(
            json['certificates'] as Map<String, dynamic>),
    languages: json['languages'] == null
        ? null
        : ProgressableAchievement.fromJson(
            json['languages'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AchievementsToJson(Achievements instance) =>
    <String, dynamic>{
      'qualifications': instance.qualifications,
      'certificates': instance.certificates,
      'languages': instance.languages,
    };
