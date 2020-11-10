import 'package:auto_size_text/auto_size_text.dart';
import 'package:endava_profile_app/common/components/sliver_add_button.dart';
import 'package:endava_profile_app/models/project.dart';
import 'package:endava_profile_app/models/skill.dart';
import 'package:endava_profile_app/modules/professional_experience/bloc/bloc.dart';
import 'package:endava_profile_app/modules/professional_experience/bloc/professional_experience_bloc.dart';
import 'package:endava_profile_app/modules/professional_experience/bloc/professional_experience_state.dart';
import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/common/components/profile_app_bar.dart';
import 'package:endava_profile_app/common/components/expandable_example.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/project_card.dart';
import 'package:reorderables/reorderables.dart';

class ProfessionalExperienceBody extends StatefulWidget {
  @override
  _ProfessionalExperienceBodyState createState() =>
      _ProfessionalExperienceBodyState();
}

class _ProfessionalExperienceBodyState
    extends State<ProfessionalExperienceBody> {
  ProfessionalExperienceBloc _bloc;
  List<Project> projects;

  @override
  void initState() {
    _bloc = BlocProvider.of<ProfessionalExperienceBloc>(context)
      ..add(ScreenCreated());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalExperienceBloc, ProfessionalExperienceState>(
        builder: (context, state) {
      if (state is ReceivedProjectList) {
        if (projects != state.projects) projects = state.projects;

        return CustomScrollView(
          slivers: [
            ProfileAppBar(
              context: context,
              hasUnsavedChanges: state.hasUnsavedChanges,
              popPayload: state.hasChanges ? 'trigger_refresh' : null,
              bgColor: Theme.of(context).scaffoldBackgroundColor,
              customTitle: AutoSizeText(
                "Professional experience",
                maxFontSize: 20,
                maxLines: 1,
                style: TextStyle(
                  color: Palette.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              onSave: () {
                _bloc.add(SaveChanges(projects));
              },
              trailingActions: [
                IconButton(
                  icon: Icon(Icons.save),
                  color: Palette.cinnabar,
                  onPressed: () {
                    _bloc.add(SaveChanges(projects));
                  },
                ),
              ],
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
                      "Add all projects that you were involved in; follow the below format, in reverse chronological order (oldest on bottom).",
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
                icon: Icon(
                  Icons.lightbulb_outline,
                  size: 30,
                  color: Palette.cinnabar,
                ),
                title: "Useful tips",
                child: Text("You can reorder your projects by either, long pressing to start dragging, or the menu \"move up/down\", options"),
              ),
            ),
            ReorderableSliverList(
              delegate: ReorderableSliverChildBuilderDelegate(
                (context, index) {
                  return ProjectCard(
                    key: ValueKey(projects[index]),
                    project: projects[index],
                    onChanged: (project) {
                      setState(() {
                        final oldProject = projects.removeAt(index);
                        projects.insert(
                            index, oldProject.updateWith(newProject: project));
                      });

                      _bloc.add(ChangesWereMade(projects));
                    },
                    onNewSkills: (skills) {
                      setState(() {
                        final oldProject = projects.removeAt(index);
                        projects.insert(
                            index, oldProject.copyWith(skills: skills));
                      });

                      _bloc.add(ChangesWereMade(projects));
                    },
                    onEvent: (event) {
                      switch (event) {
                        case ProjectCardEvent.moveUp:
                          _moveUp(index);
                          break;
                        case ProjectCardEvent.moveDown:
                          _moveDown(index);
                          break;
                        case ProjectCardEvent.delete:
                          setState(() {
                            projects.removeAt(index);
                          });
                          break;
                      }

                      _bloc.add(ChangesWereMade(projects));
                    },
                  );
                },
                childCount: projects.length,
              ),
              onReorder: _reorder,
            ),
            SliverAddButton(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              title: "Add new project",
              onTap: () {
                _bloc.add(AddNewProject());
              },
            ),
          ],
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Palette.cinnabar),
            strokeWidth: 6,
          ),
        );
      }
    });
  }

  _moveDown(int index) {
    if (projects != null && index < projects.length) _reorder(index, index + 1);
  }

  _moveUp(int index) {
    if (index > 0) _reorder(index, index - 1);
  }

  _reorder(int oldIndex, int newIndex) {
    setState(() {
      final project = projects.removeAt(oldIndex);
      projects.insert(newIndex, project);
    });

    _bloc.add(ChangesWereMade(projects));
  }
}
