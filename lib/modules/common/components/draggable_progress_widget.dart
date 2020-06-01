import 'dart:math';

import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';

class DraggableProgress extends StatefulWidget {
  List<String> levels = List();
  int selectedLevel;
  Function(String selectedLevel) onLevelSelected;

  DraggableProgress(this.levels, this.selectedLevel, this.onLevelSelected);

  @override
  _DraggableProgressState createState() => _DraggableProgressState();
}

class _DraggableProgressState extends State<DraggableProgress> {
  static final thumbWidth = 64.0;
  static final thumbHeight = 18.0;
  static final barHeight = 8.0;
  static final levelStartingPoint = thumbWidth / 2;
  static final barVerticalMargin = (thumbHeight - barHeight) / 2;

  GlobalKey keyRed = GlobalKey();
  List<double> levelsPoints = List();
  double startingPoint = 0.0;
  double endingPoint;
  double currentDx;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    if (endingPoint == null) {
      setState(() {
        endingPoint = _getSize().width;
        if (levelsPoints == null || levelsPoints.isEmpty) {
          if (widget.levels.length == 2) {
            levelsPoints = [levelStartingPoint, endingPoint - levelStartingPoint];
          } else {
            var distanceBetweenLevels = (endingPoint - levelStartingPoint * 2) / (widget.levels.length - 1);
            var levelPoint = levelStartingPoint;
            for (int i = 0; i < widget.levels.length; i++) {
              levelsPoints.add(levelPoint);
              levelPoint += distanceBetweenLevels;
            }
          }
        }
        currentDx = levelsPoints[widget.selectedLevel] - thumbWidth / 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (endingPoint == null) {
      return Container(key: keyRed);
    }
    return _mainWidget();
  }

  Widget _mainWidget() {
    return Container(
      key: keyRed,
      child: GestureDetector(
          child: Stack(
            children: <Widget>[
              _bar(),
              _getLevels(),
              _thumb(),
            ],
          ),
          onTapDown: (tapInfo) {
            _onPointMoved(tapInfo.localPosition.dx);
          },
          onTapUp: (_) {
            _onPointChanged();
          },
          onHorizontalDragUpdate: (dragInfo) {
            _onPointMoved(dragInfo.localPosition.dx);
          },
          onHorizontalDragEnd: (_) {
            _onPointChanged();
          }),
    );
  }

  int _getClosestLevelIndex() {
    var thumbCenterPosition = currentDx + thumbWidth / 2;
    List<double> distancesBetweenLevelsAndThumb = levelsPoints.map((x) => (x - thumbCenterPosition).abs()).toList();
    var closestLevel = distancesBetweenLevelsAndThumb.reduce(min);
    return distancesBetweenLevelsAndThumb.indexOf(closestLevel);
  }

  void _onPointChanged() {
    widget.onLevelSelected(getKnowledgeLevel());
    setState(() {
      currentDx = levelsPoints[_getClosestLevelIndex()] - thumbWidth / 2;
    });
  }

  void _onPointMoved(double dxPosition) {
    final thumbHalf = thumbWidth / 2;
    var dx = dxPosition;
    if (dx < thumbHalf) {
      dx = startingPoint;
    } else if (dx > endingPoint - thumbHalf) {
      dx = endingPoint - thumbWidth;
    } else {
      dx = dxPosition - thumbHalf;
    }
    setState(() {
      currentDx = dx;
    });
  }

  Widget _bar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Palette.cinnabar, borderRadius: BorderRadius.circular(barHeight)),
            margin: EdgeInsets.fromLTRB(0, barVerticalMargin, 0, barVerticalMargin),
            height: barHeight,
          ),
        )
      ],
    );
  }

  Widget _thumb() {
    final double lineWidth = 2;
    final double lineHeight = 12;
    return Card(
      elevation: Dimens.defaultElevation,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(thumbHeight)),
      margin: EdgeInsets.only(left: currentDx),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: lineHeight, width: lineWidth, color: Palette.whiteSmoke),
            SizedBox(width: lineWidth),
            Container(height: lineHeight, width: lineWidth, color: Palette.whiteSmoke),
            SizedBox(width: lineWidth),
            Container(height: lineHeight, width: lineWidth, color: Palette.whiteSmoke)
          ],
        ),
        height: thumbHeight,
        width: thumbWidth,
      ),
    );
  }

  Widget _getLevels() {
    return Stack(
        children: levelsPoints
            .map((levelPoint) => Container(
                  height: barHeight,
                  width: barHeight,
                  margin: EdgeInsets.fromLTRB(levelPoint - (barHeight / 2), barVerticalMargin, 0, barVerticalMargin),
                  decoration: BoxDecoration(color: Palette.tomato, borderRadius: BorderRadius.circular(barHeight)),
                ))
            .toList());
  }

  String getKnowledgeLevel() {
    return widget.levels[_getClosestLevelIndex()];
  }

  Size _getSize() {
    final RenderBox renderWidget = keyRed.currentContext.findRenderObject();
    return renderWidget.size;
  }
}
