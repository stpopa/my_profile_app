import 'package:flutter/material.dart';
import 'selectable_chip.dart';
import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/components/basic_input.dart';
import 'package:endava_profile_app/common/components/title_input.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/models/project.dart';
import 'package:endava_profile_app/models/skill.dart';

enum ProjectCardEvent { addAbove, addBelow, moveUp, moveDown, delete }

class ProjectCard extends StatefulWidget {
  final Key key;
  final Project project;
  final ValueChanged<ProjectCardEvent> onEvent;
  final ValueChanged<Project> onChanged;
  final ValueChanged<List<Skill>> onNewSkills;

  ProjectCard({
    this.key,
    this.project,
    this.onEvent,
    this.onChanged,
    this.onNewSkills,
  }): super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState(project);
}

class _ProjectCardState extends State<ProjectCard> {
  final _levels = ["Beginner", "Intermediate", "Advanced", "Expert"];
  Project _project;

  _ProjectCardState(this._project);

  final _events = {
    ProjectCardEvent.moveUp: 'Move up',
    ProjectCardEvent.moveDown: 'Move down',
    ProjectCardEvent.delete: 'Delete'
  };

  _onEditingComplete() {
    if (widget.onChanged != null)
      widget.onChanged(_project);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        Dimens.spacingMedium,
        20,
        Dimens.spacingMedium,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Project:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert_outlined),
                onSelected: (value) {
                  if (widget.onEvent != null) {
                    _events.forEach((key, _) {
                      if (key.toString() == value) widget.onEvent(key);
                    });
                  }
                },
                itemBuilder: (context) {
                  return _events.keys.map((event) {
                    return PopupMenuItem<String>(
                      value: event.toString(),
                      child: Text(_events[event]),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          TitleInput(
            initialString: _project.title,
            hintText:
            "Job Title, Project name, Client Name (month, year – month, year)",
            onChanged: (value) {
              setState(() {
                _project = _project.copyWith(title: value);
              });
            },
            onEditingComplete: _onEditingComplete,
          ),
          BasicInput(
            initialString: _project.description,
            hintText:
            "Brief (2-3 line) project description including key business requirements and technologies. ",
            onChanged: (value) {
              setState(() {
                _project = _project.copyWith(description: value);
              });
            },
            onEditingComplete: _onEditingComplete,
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
            initialString: widget.project.responsibilities,
            hintText:
            "Job Title, Project name, Client Name (month, year – month, year)",
            onChanged: (value) {
              setState(() {
                _project = _project.copyWith(responsibilities: value);
              });
            },
            onEditingComplete: _onEditingComplete,
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
            alignment: WrapAlignment.start,
            children: _generateSkills(),
          ),
          SizedBox(height: 30),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Palette.darkGray, width: 1),
        ),
      ),
    ); /**/
  }

  List<Widget> _generateSkills() {
    final List fixedList = Iterable<int>.generate(_project.skills.length)
        .toList();

    return fixedList.map((index) {
      Skill skill = _project.skills[index];

      return ProgramingLanguageChip(
        language: skill.title,
        level: _levels[(skill.level - 1) % _levels.length],
        selected: skill.selected,
        selectionChanged: (selected) {
          setState(() {
            final oldSkill = _project.skills.removeAt(index);
            _project.skills.insert(
                index, oldSkill.copyWith(selected: selected));
          });

          widget.onNewSkills(widget.project.skills);
        },
      );
    }).toList();
  }
}

class ProgramingLanguageChip extends StatelessWidget {
  final String language;
  final String level;
  final bool selected;
  final ValueChanged<bool> selectionChanged;

  ProgramingLanguageChip({
    this.language,
    this.level,
    this.selected = false,
    this.selectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableChip(
      title: language,
      subtitle: level,
      selected: selected,
      selectionChanged: selectionChanged,
    );
  }
}
