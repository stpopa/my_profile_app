import 'package:endava_profile_app/models/item.dart';
import 'package:endava_profile_app/models/project.dart';
import 'package:endava_profile_app/models/skill.dart';
import 'package:endava_profile_app/services/item_service.dart';

import 'dart:async';
import 'dart:convert' as convert;

class ProfessionalExperienceService {
  final String _itemKey = 'portfolio';

  ItemService itemService = ItemService();

  Future<List<Project>> update(List<Project> projects) async {
    final item = await itemService.add(
      Item(
        key: _itemKey,
        value: convert.json.encode(projects),
      ),
    );

    return Project.createListFrom(convert.json.decode(item.value));
  }

  Future<List<Project>> getProjects() async {
    final item = await itemService.get(_itemKey);

    return Project.createListFrom(convert.json.decode(item.value));
  }
}
