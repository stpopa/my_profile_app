import 'package:json_annotation/json_annotation.dart';

part 'skills_request_content.g.dart';

@JsonSerializable(nullable: true)
class SkillsRequestContent {
  final String key;
  dynamic value;

  SkillsRequestContent({
    this.key,
    this.value,
  });

  factory SkillsRequestContent.fromJson(Map<String, dynamic> json) =>
      _$SkillsRequestContentFromJson(json);

  Map<String, dynamic> toJson() => _$SkillsRequestContentToJson(this);
}
