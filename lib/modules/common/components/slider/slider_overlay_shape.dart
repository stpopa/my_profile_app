import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:flutter/material.dart';

class SliderOverlayShape extends SliderComponentShape {
  final double _cornerRadius = 20.0;
  final double _padding = 20.0;

  final Size _thumbSize = const Size(Dimens.thumbWidth, Dimens.thumbHeight);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return _thumbSize;
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;

    final Tween<double> widthTween = Tween<double>(
      begin: 0.0,
      end: _thumbSize.width + _padding,
    );

    final Tween<double> heightTween = Tween<double>(
      begin: 0.0,
      end: _thumbSize.height + _padding,
    );

    final rect = Rect.fromCenter(
      center: center,
      width: widthTween.evaluate(activationAnimation),
      height: heightTween.evaluate(activationAnimation),
    );

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left, rect.top),
        Offset(rect.right, rect.bottom),
      ),
      Radius.circular(_cornerRadius),
    );

    canvas.drawRRect(
      rrect,
      Paint()..color = sliderTheme.overlayColor.withOpacity(0.4),
    );
  }
}
