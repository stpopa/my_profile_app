import 'dart:async';
import 'dart:convert';

import 'package:endava_profile_app/models/item.dart';
import 'package:endava_profile_app/modules/education/bloc/achievements_bloc.dart';
import 'package:endava_profile_app/modules/education/models/achievements.dart';
import 'package:endava_profile_app/services/item_service.dart';
import 'package:flutter/cupertino.dart';

enum EducationTrainingEvent { FETCH, SAVE }

const String EDUCATION_TRAINING_ITEM_KEY = "education_training";

class EducationTrainingBloc {
  final BuildContext context;
  AchievementsChangesController achievementsChangesController = AchievementsChangesController();
  ItemService itemService = ItemService();

  /*Events*/
  StreamController<EducationTrainingEvent> eventsController = StreamController<EducationTrainingEvent>();

  Sink<EducationTrainingEvent> get eventsSink => eventsController.sink;

  /*Achievements response*/
  StreamController<Achievements> achievementsController = StreamController<Achievements>();

  Stream<Achievements> get achievementsStream => achievementsController.stream;


  EducationTrainingBloc(this.context) {
    eventsController.stream.listen(onNewEvent);
  }

  void onNewEvent(EducationTrainingEvent event) {
    if (event == EducationTrainingEvent.FETCH) {
      _fetchAchievements();
    }
    if (event == EducationTrainingEvent.SAVE) {
      _saveAchievements();
    }
  }

  void _fetchAchievements() {
    itemService.get(EDUCATION_TRAINING_ITEM_KEY).then((item) {
      var achievements = Achievements.fromJson(item.value);
      if (achievements.hasData()) {
        achievementsController.add(achievements);
        achievementsChangesController.setInitialAchievements(achievements);
      } else {
        _getDefaultData((achievements) {
          achievementsController.add(achievements);
          achievementsChangesController.setInitialAchievements(achievements);
        });
      }
    }).catchError((error) {
      _getDefaultData((achievements) {
        achievementsController.add(achievements);
        achievementsChangesController.setInitialAchievements(achievements);
      });
    });
  }

  void _getDefaultData(Function onDone) {
    DefaultAssetBundle.of(context).loadString("assets/files/base_data_education_training_screen.json").then((string) {
      onDone(Achievements.fromJson(json.decode(string)));
    });
  }

  void _saveAchievements() {
    itemService
        .add(Item(key: EDUCATION_TRAINING_ITEM_KEY, value: achievementsChangesController.getCurrentData().toJson()))
        .then((item) {
      achievementsChangesController.anyUnsavedChanges = false;
     
    });
  }

  bool anyUnsavedChanges() {
    return achievementsChangesController.anyUnsavedChanges;
  }

  dispose() {
    achievementsController.close();
    eventsController.close();
    achievementsChangesController.dispose();
  }
}
