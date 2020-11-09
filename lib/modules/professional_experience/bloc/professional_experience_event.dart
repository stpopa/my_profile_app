import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:endava_profile_app/models/skill.dart';
import 'package:endava_profile_app/models/project.dart';

abstract class ProfessionalExperienceEvent extends Equatable {
  const ProfessionalExperienceEvent();

  @override
  List<Object> get props => [];
}

class ScreenCreated extends ProfessionalExperienceEvent {}

class ChangesWereMade extends ProfessionalExperienceEvent {
  final List<Project> projects;

  ChangesWereMade(this.projects);
}

class SaveChanges extends ProfessionalExperienceEvent {}