import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgressBarPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color foregroundColor;
  final Color defaultForegroundColor;

  CircleProgressBarPainter({
    @required this.foregroundColor,
    @required this.defaultForegroundColor,
    @required this.percentage,
    double strokeWidth,
  }) : this.strokeWidth = strokeWidth ?? 6;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final Size constrainedSize =
        size - Offset(this.strokeWidth, this.strokeWidth);
    final shortestSide = min(constrainedSize.width, constrainedSize.height);

    final radius = (shortestSide / 2);
    final double startAngle = (2 * pi * 0.25);
    final double sweepAngle = (2 * pi * (this.percentage ?? 0));

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      2 * pi,
      false,
      _buildPaint(this.defaultForegroundColor)
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      _buildPaint(this.foregroundColor)
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleProgressBarPainter);
    return oldPainter.percentage != this.percentage ||
        oldPainter.foregroundColor != this.foregroundColor ||
        oldPainter.strokeWidth != this.strokeWidth;
  }

  Paint _buildPaint(Color color){
    return Paint()
      ..color = color
      ..strokeWidth = this.strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }
}
