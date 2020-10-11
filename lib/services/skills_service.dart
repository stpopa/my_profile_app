import 'package:endava_profile_app/models/item.dart';
import 'package:endava_profile_app/modules/core_skills/models/skill_category.dart';
import 'package:endava_profile_app/services/global_item_service.dart';

enum SkillsPath { skills, update }

class SkillsService {
  GlobalItemService itemService = GlobalItemService();

  Future<List<SkillCategory>> getSkills() async {
    final response = await itemService.get('skills');

    return _parseSkillsFrom(response);
  }

  Future<List<SkillCategory>> update(String updatedItem) async {
    final response = await itemService.post(updatedItem);

    return _parseSkillsFrom(response);
  }

  List<SkillCategory> _parseSkillsFrom(Item item) {
    var skillCategories = item.value as List<dynamic>;

    return skillCategories
        .map((category) => SkillCategory.fromJson(category))
        .toList();
  }
}
