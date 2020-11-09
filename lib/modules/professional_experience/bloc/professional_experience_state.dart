import 'package:equatable/equatable.dart';
import 'package:endava_profile_app/models/project.dart';

class ProfessionalExperienceState extends Equatable {
  const ProfessionalExperienceState();

  factory ProfessionalExperienceState.initial() {
    return ProfessionalExperienceState();
  }

  @override
  List<Object> get props => [];
}

class ReceivedProjectList extends ProfessionalExperienceState {
  final List<Project> projects;
  final bool hasUnsavedChanges;
  final bool hasChanges;

  ReceivedProjectList({this.projects, this.hasUnsavedChanges, this.hasChanges});
}

class Networking extends ProfessionalExperienceState {}