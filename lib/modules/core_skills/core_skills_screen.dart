import 'package:endava_profile_app/modules/core_skills/bloc/bloc.dart';
import 'package:endava_profile_app/modules/core_skills/core_skills_content.dart';
import 'package:endava_profile_app/services/item_service.dart';
import 'package:endava_profile_app/services/skills_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoreSkillsScreen extends StatelessWidget {
  final ItemService itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SkillsBloc(
        SkillsService(
          itemService: itemService,
        ),
      ),
      child: CoreSkillsContent(),
    );
  }
}
