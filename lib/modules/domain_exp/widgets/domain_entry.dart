import 'package:endava_profile_app/common/constants/dimens.dart';
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
                onTap: () => bloc.addEvent(DeleteEntry(id: this.id)),
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
