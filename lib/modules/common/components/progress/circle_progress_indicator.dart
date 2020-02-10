import 'package:flutter/material.dart';
import 'circle_progress_bar_painter.dart';

class CircleProgressBar extends StatelessWidget {
  final Color foregroundColor;
  final Color defaultForegroundColor;
  final double value;
  final double width;
  final double height;

  const CircleProgressBar({
    @required this.width,
    @required this.height,
    @required this.foregroundColor,
    @required this.defaultForegroundColor,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor = this.foregroundColor;
    return Container(
      width: this.width,
      height: this.height,
      child: CustomPaint(
        child: Container(),
        foregroundPainter: CircleProgressBarPainter(
          foregroundColor: foregroundColor,
          defaultForegroundColor: defaultForegroundColor,
          percentage: this.value,
        ),
      ),
    );
  }
}
