import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:endava_profile_app/modules/core_skills/models/skill_category.dart';
import 'package:endava_profile_app/modules/core_skills/models/skills_request_content.dart';
import 'package:endava_profile_app/modules/home/models/home_category.dart';
import 'package:endava_profile_app/services/skills_service.dart';

import 'skills_event.dart';
import 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  final SkillsService skillsService;

  SkillsBloc(this.skillsService);

  @override
  SkillsState get initialState => Loading();

  @override
  Stream<SkillsState> mapEventToState(SkillsEvent event) async* {
    if (event is Fetch) {
      try {
        final List<SkillCategory> categories = await skillsService.getSkills();
        yield Loaded(categories: categories);
      } catch (_) {
        yield Failure();
      }
    }
    if (event is Update) {
      if (state is Loaded) {
        try {
          var categories =
              List<SkillCategory>.from((state as Loaded).categories)
                  .map(
                    (category) => category.copyWith(
                      skills: category.skills
                          .map(
                            (skill) => skill.id == event.skillId
                                ? skill.copyWith(level: event.skillLevel)
                                : skill,
                          )
                          .toList(),
                    ),
                  )
                  .where((category) => category.skills.isNotEmpty)
                  .toList();

          final List<SkillCategory> response = await skillsService.update(
            jsonEncode(
              SkillsRequestContent(
                key: HomeCategoryData.keyFor(HomeCategory.skills),
                value: categories,
              ),
            ),
          );

          yield Loaded(categories: response);
        } catch (_) {
          yield Failure();
        }
      }
    }
    if (event is Delete) {
      if (state is Loaded) {
        try {
          var categories =
              List<SkillCategory>.from((state as Loaded).categories)
                  .map(
                    (category) => category.copyWith(
                      skills: category.skills
                          .where(
                            (skill) => skill.id != event.skillId,
                          )
                          .toList(),
                    ),
                  )
                  .where((category) => category.skills.isNotEmpty)
                  .toList();

          final List<SkillCategory> response = await skillsService.update(
            jsonEncode(
              SkillsRequestContent(
                key: HomeCategoryData.keyFor(HomeCategory.skills),
                value: categories,
              ),
            ),
          );

          yield Loaded(categories: response);
        } catch (_) {
          yield Failure();
        }
      }
    }
  }
}
