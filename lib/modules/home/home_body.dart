import 'package:endava_profile_app/modules/home/models/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/profile_card_empty.dart';
import 'home_bloc.dart';
import 'models/category.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context)
      ..eventSink.add(HomeEventType.initial);
    return StreamBuilder<Profile>(
        stream: bloc.profileStream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
              strokeWidth: 6,
            ));
          } else {
            var profile = snapshot.data;
            return CustomScrollView(slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
                            child: Text(
                              'TO DO',
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: SizedBox() //todo ProgressChart(),
                              ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
                            child: Text(
                              'TO DO',
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Padding(
                          padding: const EdgeInsets.all(0),
                          child: ProfileCardEmpty(profile
                              .categories[CategoryType.values[index - 1]]));
                    }
                  }, childCount: profile.categories.length + 1),
                ),
              )
            ]);
          }
        });
  }
}
