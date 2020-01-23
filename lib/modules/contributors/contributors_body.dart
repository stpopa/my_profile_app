import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contributors_bloc.dart';
import 'components/contributor_card/contribuitor_card.dart';
import 'models/contributor.dart';
import 'models/user.dart';
import 'components/contributor_card/user_card.dart';
import 'components/cache_card/cache_card.dart';

class ContributorsBody extends StatelessWidget {
  final User designer;

  ContributorsBody({this.designer});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ContributorsBloc>(context)
      ..eventSink.add(ContributorEvent(ContributorEventType.initial));

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: StreamBuilder(
        stream: bloc.contributorsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            List<Contributor> contributors = snapshot.data;

            return CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                brightness: Brightness.dark,
                pinned: true,
                forceElevated: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                elevation: 5,
                title: Text(
                  'Credits',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
                            child: Text(
                              'Design',
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: UserCard(user: designer, accessory: SizedBox()),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
                            child: Text(
                              'Development',
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: ContributorCard(
                          contributor: contributors[index - 1],
                          accessory: _accessoryFor(index - 1),
                        ),
                      );
                    }
                  },
                  childCount: contributors.length + 1,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: CacheCard(repository: bloc.repository),
              )
            ]);
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
              strokeWidth: 6,
            ));
          }
        },
      ),
    );
  }

  ContributorAccessory _accessoryFor(int index) {
    if (index == 0)
      return ContributorAccessory.first;
    else if (index > 0 && index < 3)
      return ContributorAccessory.top3;

    return ContributorAccessory.none;
  }
}
