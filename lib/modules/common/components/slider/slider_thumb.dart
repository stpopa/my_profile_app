import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/common/constants/palette.dart';
import 'package:flutter/material.dart';

class SliderThumb extends SliderComponentShape {
  final double thumbRadius = 10.0;

  final int _lineSpacing = 4;
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

    final rect = Rect.fromCenter(
      center: center,
      width: _thumbSize.width,
      height: _thumbSize.height,
    );

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left, rect.top),
        Offset(rect.right, rect.bottom),
      ),
      Radius.circular(thumbRadius),
    );

    final fillPaint = Paint()
      ..color = Palette.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Palette.darkGray.withOpacity(0.5)
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, 5);

    final linePaint = Paint()
      ..color = Palette.gainsboro
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rrect, shadowPaint);
    canvas.drawRRect(rrect, fillPaint);

    canvas.drawLine(
      Offset(rect.center.dx, rect.top + _lineSpacing),
      Offset(rect.center.dx, rect.bottom - _lineSpacing),
      linePaint,
    );
    canvas.drawLine(
      Offset(rect.center.dx - _lineSpacing, rect.top + _lineSpacing),
      Offset(rect.center.dx - _lineSpacing, rect.bottom - _lineSpacing),
      linePaint,
    );
    canvas.drawLine(
      Offset(rect.center.dx + _lineSpacing, rect.top + _lineSpacing),
      Offset(rect.center.dx + _lineSpacing, rect.bottom - _lineSpacing),
      linePaint,
    );
  }
}
