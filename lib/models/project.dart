import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'skill.dart';

part 'project.g.dart';

@JsonSerializable(nullable: true)
class Project extends Equatable {
  final String title;
  final String description;
  final String responsibilities;
  final List<Skill> skills;

  Project({this.title, this.description, this.responsibilities, this.skills});

  Project copyWith({title, description, responsibilities, skills}) {
    return Project(
      title: title ?? this.title,
      description: description ?? this.description,
      responsibilities: responsibilities ?? this.responsibilities,
      skills: skills ?? this.skills,
    );
  }

  Project updateWith({Project newProject}) {
    return Project(
      title: newProject.title ?? this.title,
      description: newProject.description ?? this.description,
      responsibilities: newProject.responsibilities ?? this.responsibilities,
      skills: newProject.skills ?? this.skills,
    );
  }

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @override
  List<Object> get props =>
      [this.title, this.description, this.responsibilities, this.skills];
}
