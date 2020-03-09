import 'package:endava_profile_app/modules/core_skills/models/skill_category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SkillsState extends Equatable {
  const SkillsState();

  @override
  List<Object> get props => [];
}

class Loading extends SkillsState {}

class Loaded extends SkillsState {
  final List<SkillCategory> categories;

  const Loaded({@required this.categories});

  @override
  List<Object> get props => [categories];

  @override
  String toString() => 'Loaded { categories: ${categories.length} }';
}

class Failure extends SkillsState {}
