import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'package:endava_profile_app/models/project.dart';
import 'package:endava_profile_app/models/skill.dart';

class ProfessionalExperienceBloc
    extends Bloc<ProfessionalExperienceEvent, ProfessionalExperienceState> {
  @override
  ProfessionalExperienceState get initialState =>
      ProfessionalExperienceState.initial();

  List<Project> projects = [
    Project(title: "Judopay", skills: [
      Skill(title: "Java", level: 2, selected: true),
      Skill(title: "Swift", level: 3, selected: false),
      Skill(title: "MySQL", level: 1, selected: false),
      Skill(title: "SQL", level: 3, selected: true),
      Skill(title: "Dart", level: 3, selected: false),
    ]),
    Project(title: "Paypoint", skills: [
      Skill(title: "Java", level: 2, selected: true),
      Skill(title: "Swift", level: 3, selected: false),
      Skill(title: "MySQL", level: 1, selected: true),
      Skill(title: "SQL", level: 3, selected: true),
      Skill(title: "Dart", level: 3, selected: false),
    ]),
    Project(skills: [
      Skill(title: "Java", level: 2, selected: true),
      Skill(title: "Swift", level: 3, selected: true),
      Skill(title: "MySQL", level: 1, selected: true),
      Skill(title: "SQL", level: 3, selected: false),
      Skill(title: "Dart", level: 3, selected: false),
    ])
  ];

  bool hasUnsavedChanges = false;
  bool hasChanges = false;

  @override
  void onTransition(
      Transition<ProfessionalExperienceEvent, ProfessionalExperienceState>
          transition) {}

  @override
  Stream<ProfessionalExperienceState> mapEventToState(
      ProfessionalExperienceEvent event) async* {
    if (event is ChangesWereMade) {
      hasUnsavedChanges = true;
    } else if (event is ScreenCreated) {
      // save
      // hasChanges = hasUnsavedChanges && successfulSave

      yield ReceivedProjectList(
        projects: projects,
        hasChanges: hasChanges,
        hasUnsavedChanges: hasUnsavedChanges,
      );

      hasUnsavedChanges = false;
      hasChanges = false;
    }
  }
}
