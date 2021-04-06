import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/modules/domain_exp/bloc/domain_exp_events.dart';
import 'package:endava_profile_app/modules/domain_exp/bloc/domain_exp_provider.dart';
import 'package:flutter/material.dart';
import 'sized_icon.dart';

class DomainEntry extends StatelessWidget {
  final String id;
  final String title;
  final String details;

  DomainEntry({
    this.id,
    this.title,
    this.details,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = DomainExpProvider.of(context);

    void _deleteEntry(String id) {
      showDialog(
          context: context,
          builder: (bctx) {
            return AlertDialog(
              title: Text('Delete Experience?'),
              content: Text(
                  'Once you delete this, you won\'t be able to get it back.'),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Palette.gray,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: Palette.cinnabar,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    bloc.addEvent(DeleteEntry(id: id));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.spacingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: Dimens.spacingMedium),
              GestureDetector(
                onTap: () => _deleteEntry(this.id),
                child: SizedIcon.asset('assets/images/delete.png'),
              ),
            ],
          ),
          SizedBox(height: Dimens.spacingSmall),
          Padding(
            padding: const EdgeInsets.only(right: Dimens.spacingHuge),
            child: Text(
              details,
              style: TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
