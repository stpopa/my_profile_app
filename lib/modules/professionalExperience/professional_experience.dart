import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/modules/professionalExperience/professional_experience_example.dart';
import 'package:endava_profile_app/modules/professionalExperience/professional_experience_project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:keyboard_avoider/keyboard_avoider.dart';

class ProgrammingLanguages {
  String language;
  String experience;
  ProgrammingLanguages(this.language, this.experience);
}

class ProfessionalExperienceScreen extends StatefulWidget {
  final selectedValues = <int>[];
  var projects = 4;
  @override
  _ProfessionalExperienceScreenState createState() =>
      _ProfessionalExperienceScreenState();
}

class _ProfessionalExperienceScreenState
    extends State<ProfessionalExperienceScreen> {
  final programmingLanguages = <ProgrammingLanguages>[
    ProgrammingLanguages('JavaSCRIPT', 'Beginner'),
    ProgrammingLanguages('XML', 'Beginner'),
    ProgrammingLanguages('JAVA', 'Advanced'),
    ProgrammingLanguages('REACT', 'Intermediate'),
    ProgrammingLanguages('SQL', 'Intermediate')
  ];
  @override
  Widget build(BuildContext context) {
    final hint =
        "Add all projects that you were involved in; follow the below format, in reverse chronological order. ";

    return Scaffold(
        body: KeyboardAvoider(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: ListView.separated(
                itemCount: widget.projects,
                separatorBuilder: (BuildContext context, int index) {
                  if (index == 2 || index == 3) {
                    return Container();
                  }
                  return Divider(
                    color: Colors.grey[350],
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        hint,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Palette.hintColor,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }
                  if (index == 1) {
                    return ProfessionalExperienceExample();
                  }
                  if (index == widget.projects - 1) {
                    return Row(
                      children: <Widget>[
                        Spacer(),
                        GestureDetector(child: Image.asset(
                          'assets/images/delete.png',
                          height: 24,
                          width: 24,
                        ), onTap: () {
                          setState(() {
                            widget.projects = widget.projects + 1;
                          });
                        },),

                      ],
                    );
                  }
                  return ProfessionalExperienceProject();
                }),
          ),
        ),
      ),
    ));
  }
}
