import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'circular_button.dart';

class ProgressBar extends StatelessWidget {
  final double percent;

  ProgressBar({
    this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      startAngle: 180.0,
      radius: Dimens.progressBarRadius,
      lineWidth: Dimens.progressBarLineWidth,
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
      percent: percent,
      center: CircularButton(
        icon: percent < 1.0 ? Icons.arrow_forward_ios : Icons.check,
        onPressed: percent == 0.0 ? null : () {},
      ),
      footer: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.spacingMedium),
        child: Text(
          'Preview and publish',
          style: Theme.of(context).textTheme.subhead.copyWith(
                color: Colors.black,
              ),
        ),
      ),
      backgroundColor: Palette.gainsboro,
      progressColor: Palette.cinnabar,
    );
  }
}
