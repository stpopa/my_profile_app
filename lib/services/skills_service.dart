import 'package:endava_profile_app/models/item.dart';
import 'package:endava_profile_app/modules/core_skills/models/skill_category.dart';
import 'package:endava_profile_app/services/global_item_service.dart';
import 'package:endava_profile_app/services/item_service.dart';

enum SkillsPath { skills, update }

class SkillsService {
  ItemService itemService = ItemService();
  GlobalItemService globalItemService = GlobalItemService();

  Future<List<SkillCategory>> getSkills() async {
    try {
      final response = await itemService.get('skills');

      return _parseSkillsFrom(response);
    } catch (e) {
      final defaultSkills = await globalItemService.get('skills');
      await itemService.add(defaultSkills);

      return _parseSkillsFrom(defaultSkills);
    }
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
