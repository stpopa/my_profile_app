import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;
  final Function(String) validator;

  TextInput(
      {@required this.hintText,
      this.obscureText = false,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical(y: 0),
      style: TextStyle(
        color: Theme.of(context).primaryColorDark,
      ),
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText, hintStyle: Theme.of(context).textTheme.subhead),
    );
  }
}
