import 'dart:math';

import 'package:flutter/material.dart';

class SliderTrack extends RoundedRectSliderTrackShape {
  final int trackRightMargin = 5;

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        @required RenderBox parentBox,
        @required SliderThemeData sliderTheme,
        @required Animation<double> enableAnimation,
        @required TextDirection textDirection,
        @required Offset thumbCenter,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 2,
      }) {
    if (sliderTheme.trackHeight <= 0) {
      return;
    }

    final Size thumbSize = sliderTheme.thumbShape.getPreferredSize(
      isEnabled,
      isDiscrete,
    );

    final thumbHalf = thumbSize.width / 2;

    final ColorTween activeTrackColorTween = ColorTween(
      begin: sliderTheme.disabledActiveTrackColor,
      end: sliderTheme.activeTrackColor,
    );

    final ColorTween inactiveTrackColorTween = ColorTween(
      begin: sliderTheme.disabledInactiveTrackColor,
      end: sliderTheme.inactiveTrackColor,
    );

    final Paint activePaint = Paint()
      ..color = activeTrackColorTween.evaluate(
        enableAnimation,
      );

    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(
        enableAnimation,
      );

    Paint leftTrackPaint;
    Paint rightTrackPaint;

    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Rect leftTrackArcRect = Rect.fromLTWH(
      trackRect.left - thumbHalf,
      trackRect.top,
      trackRect.height,
      trackRect.height,
    );

    if (!leftTrackArcRect.isEmpty)
      context.canvas.drawArc(
        leftTrackArcRect,
        pi / 2,
        pi,
        false,
        leftTrackPaint,
      );

    final Rect rightTrackArcRect = Rect.fromLTWH(
      trackRect.right - trackRect.height / 2 + thumbHalf - trackRightMargin,
      trackRect.top,
      trackRect.height,
      trackRect.height,
    );

    if (!rightTrackArcRect.isEmpty)
      context.canvas.drawArc(
        rightTrackArcRect,
        -pi / 2,
        pi,
        false,
        rightTrackPaint,
      );

    final Rect leftTrackSegment = Rect.fromLTRB(
      trackRect.left + trackRect.height / 2 - thumbHalf,
      trackRect.top,
      thumbCenter.dx - thumbSize.width / 2,
      trackRect.bottom,
    );

    if (!leftTrackSegment.isEmpty)
      context.canvas.drawRect(
        leftTrackSegment,
        leftTrackPaint,
      );

    final Rect rightTrackSegment = Rect.fromLTRB(
      thumbCenter.dx + thumbSize.width / 2,
      trackRect.top,
      trackRect.right + thumbHalf - trackRightMargin,
      trackRect.bottom,
    );

    if (!rightTrackSegment.isEmpty)
      context.canvas.drawRect(
        rightTrackSegment,
        rightTrackPaint,
      );
  }
}
