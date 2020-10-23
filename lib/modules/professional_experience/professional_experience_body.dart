import 'package:endava_profile_app/common/components/title_input.dart';
import 'package:endava_profile_app/common/components/basic_input.dart';
import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/common/components/profile_app_bar.dart';
import 'package:endava_profile_app/common/components/expandable_example.dart';
import 'package:endava_profile_app/common/constants/dimens.dart';

class ProfessionalExperienceBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProfileAppBar(
          context: context,
//          hasUnsavedChanges: state.hasUnsavedChanges,
//          popPayload: state.hasChanges ? 'trigger_refresh' : null,
          bgColor: Theme.of(context).scaffoldBackgroundColor,
          customTitle: Text(
            "Professional experience",
            style: TextStyle(
              color: Palette.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailingActions: [],
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 15),
                Text(
                  "Add all projects that you were involved in; follow the below format, in reverse chronological order.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Palette.darkGray,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ExpandableExample(
            title: "Example",
            child: Text("this is the example"),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                Dimens.spacingMedium, 20, Dimens.spacingMedium, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Project:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TitleInput(
                  hintText:
                      "Job Title, Project name, Client Name (month, year – month, year)",
                ),
                BasicInput(
                  hintText:
                      "Brief (2-3 line) project description including key business requirements and technologies. ",
                ),
                SizedBox(height: 15),
                Text(
                  "Responsibilities and achievements:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                BasicInput(
                  hintText:
                      "Job Title, Project name, Client Name (month, year – month, year)",
                ),
                SizedBox(height: 15),
                Text(
                  "Programming languages:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "tap to select:",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Palette.lightGray),
                ),
                SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    ProgramingLanguageChip(language: "Java", level: "Beginner"),
                    ProgramingLanguageChip(
                        language: "Swift", level: "Advanced"),
                    ProgramingLanguageChip(language: "Dart", level: "Advanced"),
                    ProgramingLanguageChip(
                        language: "Elixir", level: "Beginner"),
                    ProgramingLanguageChip(
                        language: "Javascript", level: "Beginner"),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProgramingLanguageChip extends StatelessWidget {
  final String language;
  final String level;

  ProgramingLanguageChip({this.language, this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 3, 3),
      child: Chip(
        label: Padding(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: Column(
            children: [
              Text(
                language,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(level),
            ],
          ),
        ),
      ),
    );
  }
}
