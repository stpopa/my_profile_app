import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../contributors_bloc.dart';

class CacheCard extends StatelessWidget {
  final String repository;

  CacheCard({this.repository});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ContributorsBloc>(context)
      ..eventSink.add(ContributorEvent(ContributorEventType.cacheLifetime));

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
      child: StreamBuilder<Object>(
          stream: bloc.cacheExpirationStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.data != null) {
              DateTime expirationDate = snapshot.data;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.cached,
                    size: 35,
                    color: Theme.of(context).primaryColor.withAlpha(220),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Due to github\'s api restrictions this page is cached.',
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Cache will be automatically deleted on ' + expirationDate.toIso8601String(),
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                  strokeWidth: 3,
                ),
              );
            }
          }),
    );
  }
}
