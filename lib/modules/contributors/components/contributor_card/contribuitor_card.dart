import 'package:flutter/material.dart';
import '../../models/contributor.dart';
import 'package:provider/provider.dart';
import 'contributor_card_bloc.dart';
import 'contributor_card_body.dart';

enum ContributorAccessory { none, first, top3 }

class ContributorCard extends StatelessWidget {
  final ContributorAccessory accessory;
  final Contributor contributor;

  ContributorCard({this.accessory, this.contributor});

  @override
  Widget build(BuildContext context) {
    return Provider<ContributorCardBloc>(
      create: (context) => ContributorCardBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: ContributorCardBody(
        contributor: contributor,
        accessory: accessory,
      ),
    );
  }
}
