import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/components/title_input.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

class SearchUserBody extends StatefulWidget {
  @override
  _SearchUserBodyState createState() => _SearchUserBodyState();
}

class _SearchUserBodyState extends State<SearchUserBody> {
  SearchUserBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<SearchUserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Column(
                children: [
                  Material(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: TitleInput(
                            hintText: "Search people",
                            onChanged: (searchString) {
                              _bloc.add(SearchStringChanged(searchString));
                            },
                          ),
                        ),
                        Hero(
                          tag: 'search_user',
                          child: Icon(
                            Icons.search,
                            color: Palette.darkGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    height: 1,
                    color: Palette.darkGray,
                  ),
                ],
              ),
            ),
            BlocBuilder<SearchUserBloc, SearchUserState>(
                builder: (context, state) {
              if (state is UsersReceived) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final user = state.users[index];
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).pop(user);
                        },
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(user.thumbnail),
                        ),
                        title: Text(user.name),
                        subtitle: Text(user.role),
                      );
                    },
                    childCount: state.users.length,
                  ),
                );
              } else if (state is Networking){
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Palette.cinnabar),
                        strokeWidth: 6,
                      ),
                    ),
                  ),
                );
              }

              return SliverToBoxAdapter(
                child: SizedBox(),
              );
            }),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Palette.darkGray,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tap anywhere to  go back',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Palette.darkGray),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
