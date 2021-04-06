import '../../../common/constants/dimens.dart';
import '../../../common/constants/palette.dart';
import '../bloc/domain_exp_events.dart';
import '../bloc/domain_exp_provider.dart';
import '../helpers/domain_strings.dart';
import 'sized_icon.dart';

import 'package:flutter/material.dart';

class AddDomainButton extends StatelessWidget {
  final _buttonStyle = TextStyle(
    fontSize: 18.0,
    color: Palette.darkGray,
  );

  @override
  Widget build(BuildContext context) {

    final bloc = DomainExpProvider.of(context);

    return GestureDetector(
      onTap: () => bloc.addEvent(ToggleInput(isEnabled: true)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.spacingLarge),
        child: Row(
          children: [
            SizedIcon.asset('assets/images/add.png'),
            SizedBox(width: Dimens.spacingSmall),
            Text(
              DomainExpStrings.buttonTitle,
              style: _buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
