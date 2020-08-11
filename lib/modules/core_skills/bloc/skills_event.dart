import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SkillsEvent extends Equatable {
  const SkillsEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends SkillsEvent {}

class Update extends SkillsEvent {
  final int skillId;
  final int skillLevel;

  const Update({
    @required this.skillId,
    @required this.skillLevel,
  });

  @override
  List<Object> get props => [skillId, skillLevel];

  @override
  String toString() => 'Update {skillId: $skillId,  skillLevel: $skillLevel,}';
}

class Delete extends SkillsEvent {
  final int skillId;

  const Delete({@required this.skillId});

  @override
  List<Object> get props => [skillId];

  @override
  String toString() => 'Delete {  skillId: $skillId }';
}
