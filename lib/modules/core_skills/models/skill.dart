import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable()
class Skill {
  final int id;
  final String title;
  final String icon;
  final int level;

  const Skill({
    this.id,
    this.title,
    this.icon,
    this.level,
  });

  Skill copyWith({int level}) {
    return Skill(
      id: id,
      title: title,
      icon: icon,
      level: level ?? this.level,
    );
  }

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
