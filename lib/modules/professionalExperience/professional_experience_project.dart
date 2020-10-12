import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgrammingLanguages {
  String language;
  String experience;
  ProgrammingLanguages(this.language, this.experience);
}

class ProfessionalExperienceProject extends StatefulWidget {
  final selectedValues = <int>[];
  @override
  _ProfessionalExperienceProjectState createState() =>
      _ProfessionalExperienceProjectState();
}

class _ProfessionalExperienceProjectState
    extends State<ProfessionalExperienceProject> {
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

    return Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Project:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 8),
                  child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Palette.placeholder,
                          ),
                          hintText:
                          "Job Title, Project name, Client Name (month, year – month, year)"),
                      controller: TextEditingController(text: ""),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Palette.placeholder,
                      )),
                ),
                Container(
                  width: double.infinity,
                  child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Palette.placeholder,
                          ),
                          hintText:
                          "Brief (2-3 line) project description including key business requirements and technologies."),
                      controller: TextEditingController(text: ""),
                      style: TextStyle(
                        fontSize: 18,
                        color: Palette.placeholder,
                      )),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Responsibilities and achievements: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Palette.placeholder,
                          ),
                          hintText:
                          "Key role(s) played by the consultant and the key responsibilities and achievements."),
                      controller: TextEditingController(text: ""),
                      style: TextStyle(
                        fontSize: 18,
                        color: Palette.placeholder,
                      )),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Programming languages:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "Tap to select:",
                    style: TextStyle(
                      fontSize: 18,
                      color: Palette.placeholder,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List<Widget>.generate(
                    programmingLanguages.length,
                        (int index) {
                      return ChoiceChip(
                        label: Padding(
                          padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                          child: Column(
                            children: <Widget>[
                              Text(
                                  programmingLanguages[index]
                                      .language,
                                  style: TextStyle(fontSize: 16)),
                              Opacity(
                                opacity: 0.8,
                                child: Text(
                                  programmingLanguages[index]
                                      .experience,
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                        backgroundColor: Palette.hintColor,
                        selectedColor: Palette.cinnabar,
                        labelStyle: TextStyle(color: Colors.white),
                        selected:
                        widget.selectedValues.contains(index),
                        onSelected: (bool selected) {
                          setState(() {
                            selected
                                ? widget.selectedValues.add(index)
                                : widget.selectedValues.remove(index);
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
                SizedBox(height: 16,)
              ],
            )
          ],
        );
  }
}
