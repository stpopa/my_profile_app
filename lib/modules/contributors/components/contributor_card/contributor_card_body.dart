import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contributor_card_bloc.dart';
import 'user_card.dart';
import 'contribuitor_card.dart';
import '../../models/contributor.dart';
import 'user_card_placeholder.dart';

class ContributorCardBody extends StatelessWidget {
  final ContributorAccessory accessory;
  final Contributor contributor;

  ContributorCardBody({this.contributor, this.accessory});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ContributorCardBloc>(context)
      ..eventSink.add(
        ContributorCardEvent(
          ContributorCardEventType.initial,
          value: contributor,
        ),
      );

    return StreamBuilder(
      stream: bloc.userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.data != null) {
          return UserCard(
            user: snapshot.data,
            accessory: StackAccessory(
              accessory: accessory,
            ),
          );
        } else {
          return UserCardPlaceholder();
        }
      },
    );
  }
}

class StackAccessory extends StatelessWidget {
  final ContributorAccessory accessory;

  StackAccessory({this.accessory});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -7,
      right: -7,
      width: 30,
      height: 30,
      child: Container(
        padding: EdgeInsets.fromLTRB(4, 2, 4, 4),
        child: _imageForAccessory(),
        decoration: BoxDecoration(
          color: _colorForAccessory(),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: accessory == ContributorAccessory.none
                ? Colors.transparent
                : Colors.white,
            width: 2,
          ),
        ),
      ),
    );
  }

  Color _colorForAccessory() {
    switch (this.accessory) {
      case ContributorAccessory.first:
        return Color(0xfff4d100);
      case ContributorAccessory.top3:
        return Color(0xff4a75ff);
      case ContributorAccessory.none:
    }
    return null;
  }

  Widget _imageForAccessory() {
    switch (this.accessory) {
      case ContributorAccessory.first:
        return Image.asset('assets/images/crown-white-top.png');
      case ContributorAccessory.top3:
        return Image.asset('assets/images/crown-white.png');
      case ContributorAccessory.none:
    }
    return null;
  }
}
