import 'package:endava_profile_app/modules/core_skills/models/skill.dart';

class SkillCategory {
  final String title;
  final List<Skill> skills;

  const SkillCategory({
    this.title,
    this.skills,
  });
}

const List<SkillCategory> categories = const <SkillCategory>[
  const SkillCategory(title: 'Development', skills: skills),
  const SkillCategory(title: 'Design', skills: skills),
  const SkillCategory(title: 'Business skills', skills: skills),
  const SkillCategory(title: 'Business', skills: skills),
];
