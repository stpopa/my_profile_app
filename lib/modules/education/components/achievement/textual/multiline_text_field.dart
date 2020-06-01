import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';

class MultilineCustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String> onChange;

  MultilineCustomTextField({@required this.hint, @required this.controller, @required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: onChange,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        style: TextStyle(fontSize: Dimens.fontSizeLarge, color: Palette.gray),
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.all(0.0),
          isDense: true,
          border: InputBorder.none,
        ));
  }
}
