import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'package:endava_profile_app/common/components/profile_app_bar.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'components/user_list_card.dart';
import 'package:endava_profile_app/common/components/sliver_add_button.dart';
import 'package:endava_profile_app/common/constants.dart';
import 'package:endava_profile_app/models/user_list.dart';

class YourListsBody extends StatefulWidget {
  @override
  _YourListsBodyState createState() => _YourListsBodyState();
}

class _YourListsBodyState extends State<YourListsBody> {
  YourListsBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<YourListsBloc>(context)..add(ScreenCreatedEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YourListsBloc, YourListsState>(
        builder: (context, state) {
      if (state is ListReceived) {
        final receivedLists = state.userLists;
        return CustomScrollView(
          slivers: [
            ProfileAppBar(
              context: context,
              customTitle: Text(
                "Your Lists",
                style: TextStyle(
                  fontSize: 20,
                  color: Palette.cinnabar,
                  fontWeight: FontWeight.bold,
                ),
              ),
              hasUnsavedChanges: false,
              bgColor: Theme.of(context).scaffoldBackgroundColor,
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
                      "Here you can manage and see your lists, swipe left on a list to access its perks.",
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
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final userList = receivedLists[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: UserListCard(
                      onTapDelete: () {
                        _bloc.add(RemoveListEvent(userList: userList));
                      },
                      onTapShare: () {
                        _bloc.add(ShareListEvent(userList: userList));
                      },
                      userList: userList,
                      onTap: () {
                        _handleUserList(context, userList: userList);
                      },
                    ),
                  );
                },
                childCount: receivedLists.length,
              ),
            ),
            SliverAddButton(
              title: "Create new list",
              onTap: () {
                _handleUserList(context);
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

  _handleUserList(BuildContext context, {UserList userList}) {
    final result = Navigator.of(context).pushNamed(
      AppRoute.of(AppScreen.create_list),
      arguments: userList == null ? null : userList.uniqKey,
    );

    result.then((hasChanges) => {
      if ((hasChanges as String) == 'trigger_refresh')
        _bloc.add(ScreenCreatedEvent())
    });
  }
}
