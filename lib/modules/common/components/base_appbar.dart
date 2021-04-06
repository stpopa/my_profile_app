import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {
  final VoidCallback onBackPressed;
  final String titleAppBar;
  final List<ActionAppBar> customActions;

  BaseAppBar({Key key, this.titleAppBar, this.onBackPressed, this.customActions})
      : super(
          key: key,
          title: Text(
            titleAppBar,
            style: TextStyle(color: Palette.cinnabar),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Palette.cinnabar),
            color: Palette.cinnabar,
            onPressed: onBackPressed,
          ),
          actions: customActions
              .map((actionModel) => FlatButton(
                  child: Text(actionModel.text, style: TextStyle(color: Palette.cinnabar)),
                  onPressed: actionModel.onTap))
              .toList(),
        );
}

class ActionAppBar {
  final String text;
  final VoidCallback onTap;

  ActionAppBar({this.text, this.onTap});
}
