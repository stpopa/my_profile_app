import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/common/components/profile_app_bar.dart';
import 'bloc/bloc.dart';
import 'package:endava_profile_app/common/components/basic_input.dart';
import 'package:endava_profile_app/models/user.dart';
import 'package:endava_profile_app/modules/search_user/search_user_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CreateListBody extends StatefulWidget {
  final String listUniqKey;

  CreateListBody({this.listUniqKey});

  @override
  _CreateListBodyState createState() => _CreateListBodyState();
}

class _CreateListBodyState extends State<CreateListBody> {
  CreateListBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<CreateListBloc>(context)
      ..add(ScreenCreated(listUniqKey: widget.listUniqKey));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateListBloc, CreateListState>(builder: (context, state) {
      if (state is ListReceived) {
        print("hasChanges: ${state.hasChanges}");
        print("hasUnsavedChanges: ${state.hasUnsavedChanges}");
        return CustomScrollView(
          slivers: [
            ProfileAppBar(
              context: context,
              hasUnsavedChanges: state.hasUnsavedChanges,
              popPayload: state.hasChanges ? 'trigger_refresh' : null,
              bgColor: Theme.of(context).scaffoldBackgroundColor,
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
                ),
                Hero(
                  tag: 'search_user',
                  child: Material(
                    child: IconButton(
                      icon: Icon(Icons.search),
                      color: Palette.cinnabar,
                      onPressed: _searchUser,
                    ),
                  ),
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
                      "Name your list, and then search for people to add to the list. You can later remove the added user with a swipe to the left",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Palette.darkGray,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 1,
                      color: Palette.darkGray,
                    ),
                    SizedBox(height: 10),
                    BasicInput(
                      initialString: state.list.name,
                      hintText: "Name your list",
                      onChanged: (value) {
                        _bloc.add(NameChanged(value));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final user = state.list.users[index];

                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: UserCard(
                      user: user,
                      onTap: () {
                        // Route to user preview page, when ready
                      },
                      onTapDelete: () {
                        _bloc.add(UserRemoved(user));

                        setState(() {});
                      },
                    ),
                  );
                },
                childCount: state.list.users.length,
              ),
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

  _searchUser() async {
    User user = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (c) => SearchUserScreen(),
        fullscreenDialog: false,
      ),
    );

    if (user != null) {
      _bloc.add(UserAdded(user));

      setState(() {});
    }
  }
}

class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;

  UserCard({this.user, this.onTap, this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionExtentRatio: 0.15,
      actionPane: SlidableBehindActionPane(),
      secondaryActions: [
        Container(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Palette.wildSand,
              ),
              onPressed: onTapDelete,
            ),
          ),
          height: 70,
          decoration: BoxDecoration(
              color: Palette.cinnabar,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
        ),
      ],
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user.thumbnail),
          ),
          title: Text(user.name),
          subtitle: Text(user.role),
        ),
        elevation: 3,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
