import 'package:flutter/material.dart';
import '../constants/palette.dart';

class ProfileAppBar extends SliverAppBar {
  final BuildContext context;
  final Color bgColor;
  final List<Widget> trailingActions;
  final String stringTitle;
  final Object popPayload;
  final bool hasUnsavedChanges;
  final VoidCallback onSave;
  final VoidCallback onDiscard;

  ProfileAppBar({
    this.bgColor,
    this.context,
    this.stringTitle = '',
    this.trailingActions,
    this.popPayload,
    this.onSave,
    this.onDiscard,
    this.hasUnsavedChanges,
  });

  @override
  bool get pinned => true;

  @override
  Brightness get brightness => Brightness.dark;

  @override
  bool get forceElevated => false;

  @override
  double get elevation => 5;

  @override
  Color get backgroundColor => _color();

  @override
  Widget get leading => _buildBackButton();

  @override
  Widget get title => _buildTitle();

  @override
  List<Widget> get actions => trailingActions;

  Widget _buildTitle() {
    if (stringTitle != '')
      return Text(
        stringTitle,
        style: TextStyle(
            fontSize: 20, color: Palette.black, fontWeight: FontWeight.bold),
      );

    return FractionallySizedBox(
      widthFactor: 0.28,
      child: Image.asset(
        'assets/images/logo.png',
      ),
    );
  }

  Color _color() {
    return bgColor ?? Palette.wildSand;
  }

  Widget _buildBackButton() {
    if (context == null) return null;

    bool canPop = Navigator.of(context).canPop();

    if (canPop) {
      return FlatButton(
        padding: EdgeInsets.all(15),
        onPressed: _backPressed,
        child: Container(
          child: Image.asset('assets/images/back.png'),
        ),
      );
    }

    return null;
  }

  _backPressed() {
    if (hasUnsavedChanges != null && hasUnsavedChanges)
      _showUnsavedChangesAlertDialog();
    else
      Navigator.of(context).pop(popPayload);
  }

  _showUnsavedChangesAlertDialog() {
    if (context == null) return;

    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: Text("You have unsaved changes."),
        content: Text("Do you realy want to go back?"),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();

              if (onDiscard != null) onDiscard();

              Navigator.of(context).pop(popPayload);
            },
            child: Text("Yes, Discard"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(popPayload);
              if (onSave != null) onSave();
            },
            child: Text("No, Save"),
          ),
        ],
      ),
    );
  }
}
