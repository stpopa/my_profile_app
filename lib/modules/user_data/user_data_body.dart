import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'package:endava_profile_app/common/components/profile_app_bar.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/common/components/title_input.dart';

class UserDataBody extends StatefulWidget {
  @override
  _UserDataBodyState createState() => _UserDataBodyState();
}

class _UserDataBodyState extends State<UserDataBody> {
  UserDataBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<UserDataBloc>(context)..add(ScreenLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(builder: (context, state) {
      if (state is UserDataReceived) {
        return CustomScrollView(
          slivers: [
            ProfileAppBar(
              bgColor: Theme.of(context).scaffoldBackgroundColor,
              context: context,
              stringTitle: 'Name and role',
              popPayload: state.hasChanged ? "trigger_reload" : null,
              hasUnsavedChanges: state.hasUnsavedChanges,
              onSave: () {
                _bloc.add(SavePressed());
              },
              trailingActions: [
                IconButton(
                  icon: Icon(Icons.save),
                  color: Palette.cinnabar,
                  onPressed: () {
                    _bloc.add(SavePressed());
                  },
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Image.network(state.user.thumbnail),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Palette.darkGray,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.accessibility, size: 30),
                        SizedBox(width: 20),
                        Flexible(
                          child: TitleInput(
                            initialString: state.user.name,
                            hintText: "Name and Surname",
                            onChanged: _onNameChanged,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.info, size: 30),
                        SizedBox(width: 20),
                        Flexible(
                          child: TitleInput(
                            initialString: state.user.role,
                            hintText: "Role",
                            onChanged: _onRoleChanged,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 30),
                        SizedBox(width: 20),
                        Flexible(
                          child: TitleInput(
                            shouldSelectAll: true,
                            initialString: state.user.thumbnail,
                            hintText: "Link to your image",
                            onChanged: _onThumbnailChanged,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
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

  _onNameChanged(String value) {
    _bloc.add(NameChanged(value));
  }

  _onRoleChanged(String value) {
    _bloc.add(RoleChanged(value));
  }

  _onThumbnailChanged(String value) {
    _bloc.add(ThumbnailChanged(value));
  }
}
