import 'dart:convert';

import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/modules/common/components/base_appbar.dart';
import 'package:endava_profile_app/modules/common/components/custom_expandable_tile.dart';
import 'package:endava_profile_app/modules/education/models/achievements.dart';
import 'package:endava_profile_app/modules/education/models/example_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc/education_training_bloc.dart';
import 'components/achievement/progressable/progress_achievement_card.dart';
import 'components/achievement/textual/text_achievement_card.dart';
import 'components/example_text_widget.dart';
import 'models/progressable_achievement.dart';
import 'models/textual_achievement.dart';

class EducationTrainingScreen extends StatefulWidget {
  @override
  _EducationTrainingScreenState createState() => _EducationTrainingScreenState();
}

class _EducationTrainingScreenState extends State<EducationTrainingScreen> {
  EducationTrainingBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = EducationTrainingBloc(context);
    bloc.eventsSink.add(EducationTrainingEvent.FETCH);

    return SafeArea(
      child: WillPopScope(
        child: Scaffold(
          appBar: BaseAppBar(
            titleAppBar: "Education and training",
            onBackPressed: () => _onBackPress(),
            customActions: [ActionAppBar(text: "Save", onTap: () => _onSavePress())],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: StreamBuilder(
              stream: bloc.achievementsStream,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.active && snapshot.data != null) {
                  return Column(
                    children: <Widget>[
                      _getSubtitle(),
                      _getExampleSection(snapshot.data),
                      _getAchievementsSection(snapshot.data),
                    ],
                  );
                } else {
                  return _getLoadingIndicator();
                }
              },
            ),
          ),
        ),
        onWillPop: () => new Future(() {
          _onBackPress();
          return false;
        }),
      ),
    );
  }

  void _onBackPress() {
    if (bloc.anyUnsavedChanges()) {
      _showUnsavedChangesDialog();
    } else {
      _navigateBack();
    }
  }

  void _onSavePress() {
    bloc.eventsSink.add(EducationTrainingEvent.SAVE);
  }

  Widget _getSubtitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, Dimens.spacingMedium, 0, Dimens.spacingMedium),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Summary of relevant education,\ncourses and trainings.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Palette.suvaGrey, fontSize: 16),
        ),
      ),
    );
  }

  StatefulWidget _getExampleSection(Achievements achievements) {
    var examples = List<ExampleItemModel>();
    examples.add(ExampleItemModel(achievements.qualifications.title, achievements.qualifications.example));
    examples.add(ExampleItemModel(achievements.certificates.title, achievements.certificates.example));
    examples.add(ExampleItemModel(achievements.languages.title, achievements.languages.example));

    return CustomExpandableTile(
      title: Text(
        "Example",
        style: TextStyle(color: Colors.black, fontSize: Dimens.fontSizeMedium, fontWeight: FontWeight.bold),
      ),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(Dimens.spacingXHuge, 0, Dimens.spacingMedium, 0),
        child: Column(children: examples.map((example) => ExampleItemText(data: example)).toList()),
      ),
    );
  }

  Widget _getAchievementsSection(Achievements achievements) {
    var widgets = List<Widget>();
    widgets.add(_mapAchievement(achievements.qualifications, bloc.achievementsChangesController.qualificationsSink));
    widgets.add(_mapAchievement(achievements.certificates, bloc.achievementsChangesController.certificatesSink));
    widgets.add(_mapAchievement(achievements.languages, bloc.achievementsChangesController.languagesSink));
    return Column(children: widgets);
  }

  Widget _mapAchievement(BaseAchievement achievement, Sink<BaseAchievement> sink) {
    if (achievement is TextualAchievement) {
      return TextAchievementCard(data: achievement, onDataChanged: (newItem) => sink.add(newItem));
    }
    if (achievement is ProgressableAchievement) {
      return ProgressAchievementCard(data: achievement, onDataChanged: (newItem) => sink.add(newItem));
    }
    return Text("");
  }

  Widget _getLoadingIndicator() {
    return Container(
        height: 200,
        child: Center(
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Palette.cinnabar), strokeWidth: 6)));
  }

  Future<void> _showUnsavedChangesDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Unsaved changes'),
          content: Text('Do you want to discard the changes?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                _navigateBack();
              },
            ),
            FlatButton(child: Text('No'), onPressed: () => Navigator.of(context).pop()),
          ],
        );
      },
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
