import 'dart:async';
import 'dart:convert';

import 'package:endava_profile_app/modules/education/models/progressable_achievement.dart';
import 'package:endava_profile_app/modules/education/models/textual_achievement.dart';
import 'package:endava_profile_app/modules/education/models/achievements.dart';

class AchievementsChangesController {
  StreamController<TextualAchievement> qualificationsController = StreamController<TextualAchievement>();
  StreamController<TextualAchievement> certificatesController = StreamController<TextualAchievement>();
  StreamController<ProgressableAchievement> languagesController = StreamController<ProgressableAchievement>();

  Sink<TextualAchievement> get qualificationsSink => qualificationsController.sink;
  Sink<TextualAchievement> get certificatesSink => certificatesController.sink;
  Sink<ProgressableAchievement> get languagesSink => languagesController.sink;
  
  TextualAchievement currentQualifications;
  TextualAchievement currentCertificates;
  ProgressableAchievement currentLanguages;
  bool anyUnsavedChanges = false;

  AchievementsChangesController() {
    qualificationsController.stream.listen((qualifications) {
      anyUnsavedChanges = true;
      currentQualifications = qualifications;
    });

    certificatesController.stream.listen((certificates) {
      anyUnsavedChanges = true;
      currentCertificates = certificates;
    });

    languagesController.stream.listen((languages) {
      anyUnsavedChanges = true;
      currentLanguages = languages;
    });
  }

  Achievements getCurrentData() {
    return Achievements(
      qualifications: currentQualifications,
      certificates: currentCertificates,
      languages: currentLanguages,
    );
  }

  dispose() {
    qualificationsController.close();
    certificatesController.close();
    languagesController.close();
  }

  void setInitialAchievements(Achievements achievements) {
    currentQualifications = achievements.qualifications;
    currentCertificates = achievements.certificates;
    currentLanguages = achievements.languages;
  }
}
