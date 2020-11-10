import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'package:endava_profile_app/models/project.dart';
import 'package:endava_profile_app/models/skill.dart';
import 'package:endava_profile_app/services/professional_experience_service.dart';
import 'package:endava_profile_app/services/skills_service.dart';

class ProfessionalExperienceBloc
    extends Bloc<ProfessionalExperienceEvent, ProfessionalExperienceState> {
  ProfessionalExperienceService professionalExperienceService = ProfessionalExperienceService();
  SkillsService skillsService = SkillsService();


  @override
  ProfessionalExperienceState get initialState =>
      ProfessionalExperienceState.initial();

  List<Project> projects = [];

  bool hasUnsavedChanges = false;
  bool hasChanges = false;

  @override
  void onTransition(
      Transition<ProfessionalExperienceEvent, ProfessionalExperienceState>
          transition) {}

  @override
  Stream<ProfessionalExperienceState> mapEventToState(
      ProfessionalExperienceEvent event) async* {
    print(event);
    if (event is ChangesWereMade) {
      yield Networking();

      hasUnsavedChanges = true;

      yield ReceivedProjectList(
        projects: projects,
        hasChanges: false,
        hasUnsavedChanges: hasUnsavedChanges,
      );
    } else if (event is ScreenCreated) {
      yield Networking();

      final fetchedProjects = await professionalExperienceService.getProjects();
      projects = fetchedProjects;

      hasUnsavedChanges = false;
      hasChanges = false;

      yield ReceivedProjectList(
        projects: fetchedProjects,
        hasChanges: hasChanges,
        hasUnsavedChanges: hasUnsavedChanges,
      );
    } else if (event is SaveChanges) {
      yield Networking();

      projects = event.projects;

      final newProjects = await professionalExperienceService.update(projects);
      hasChanges = hasUnsavedChanges;
      hasUnsavedChanges = false;

      yield ReceivedProjectList(
        projects: newProjects,
        hasChanges: hasChanges,
        hasUnsavedChanges: hasUnsavedChanges,
      );
    } else if (event is AddNewProject) {
      yield Networking();
      hasUnsavedChanges = true;

      final skills = await _fetchSkills();
      projects.add(Project(skills: skills));

      yield ReceivedProjectList(
        projects: projects,
        hasChanges: hasChanges,
        hasUnsavedChanges: hasUnsavedChanges,
      );
    }
  }

  Future<List<Skill>> _fetchSkills() async {
    final categories = await skillsService.getSkills();

    List<Skill> skills = [];
    categories.forEach((category) {
      skills.addAll(category.skills);
    });

    return skills;
  }
}
