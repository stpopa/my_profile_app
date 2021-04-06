import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'filled_circle_icon.dart';

class CustomExpandableTile extends StatefulWidget {
  final Widget content;
  final Widget title;

  CustomExpandableTile({Key key, this.title, this.content}) : super(key: key);

  @override
  _CustomExpandableTileState createState() => _CustomExpandableTileState();
}

class _CustomExpandableTileState extends State<CustomExpandableTile> with TickerProviderStateMixin {
  AnimationController _arrowAnimationController;
  AnimatedBuilder _animatedArrowBuilder;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animatedArrowBuilder = AnimatedBuilder(
      animation: _arrowAnimationController,
      builder: (context, child) => Transform.rotate(
          angle: Tween(begin: 0.0, end: pi).animate(_arrowAnimationController).value, child: _getArrowIcon()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_getDivider(), _getExpandableTileWidget(), _getDivider()],
    );
  }

  Widget _getDivider() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Dimens.spacingSmall, 0, Dimens.spacingSmall, 0),
      child: Divider(height: Dimens.dividerHeight, color: Palette.darkGray),
    );
  }

  Widget _getExpandableTileWidget() {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        trailing: _animatedArrowBuilder,
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/quote.png',
              color: Palette.cinnabar,
              width: Dimens.quote_icon_width,
              height: Dimens.quote_icon_height,
            ),
            SizedBox(width: Dimens.spacingMedium),
            widget.title,
          ],
        ),
        initiallyExpanded: false,
        children: <Widget>[
          widget.content,
          SizedBox(height: Dimens.spacingMedium),
        ],
        onExpansionChanged: (isExpanded) =>
            isExpanded ? _arrowAnimationController.forward() : _arrowAnimationController.reverse(),
      ),
    );
  }

  Widget _getArrowIcon() {
    return FilledCircleIcon(
      color: Palette.cinnabar,
      icon: Icon(
        Icons.expand_more,
        size: Dimens.default_icon_size,
        color: Colors.white,
      ),
    );
  }
}
