import 'package:endava_profile_app/common/constants/palette.dart';

import '../../../common/constants/dimens.dart';
import '../../../modules/domain_exp/widgets/sized_icon.dart';

import 'package:flutter/material.dart';

class ExampleHeader extends StatelessWidget {
  final _headerStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Palette.black,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedIcon.asset('assets/images/quotes.png'),
        SizedBox(width: Dimens.spacingMedium),
        Expanded(
          child: Text(
            'Example',
            style: _headerStyle,
          ),
        ),
        SizedIcon.asset('assets/images/expand.png'),
      ],
    );
  }
}
