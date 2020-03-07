import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:flutter/material.dart';

import 'slider_overlay_shape.dart';
import 'slider_thumb.dart';
import 'slider_track.dart';

enum Level { Beginner, Intermediate, Professional }

class LevelSlider extends StatefulWidget {
  final int level;

  LevelSlider({@required this.level});

  @override
  _LevelSliderState createState() => _LevelSliderState();
}

class _LevelSliderState extends State<LevelSlider> {
  double _selectedLevel;

  @override
  void initState() {
    super.initState();

    setState(() {
      _selectedLevel = widget.level.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Level.values[_selectedLevel.toInt()].toString().split('.').last,
          style: Theme.of(context)
              .textTheme
              .subtitle
              .copyWith(color: Palette.darkGray),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Palette.cinnabar,
            inactiveTrackColor: Palette.gainsboro,
            thumbColor: Colors.redAccent,
            inactiveTickMarkColor: Palette.darkGray,
            activeTickMarkColor: Palette.harleyDavidsonOrange,
            trackHeight: Dimens.sliderTrackHeight,
            overlayColor: Palette.gainsboro,
            overlayShape: SliderOverlayShape(),
            trackShape: SliderTrack(),
            thumbShape: SliderThumb(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.spacingSmall),
            child: Slider(
              value: _selectedLevel,
              min: 0,
              max: Level.values.length.toDouble() - 1,
              divisions: Level.values.length - 1,
              onChanged: _onChanged,
            ),
          ),
        ),
      ],
    );
  }

  _onChanged(double level) {
    setState(() {
      _selectedLevel = level;
    });
  }
}
