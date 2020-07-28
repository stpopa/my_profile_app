import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String Function(dynamic) validator;
  final bool autovalidate;
  final String initialValue;

  TextInput({
    @required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.validator,
    this.autovalidate = false,
    this.initialValue = ""
  });

  @override
  Widget build(BuildContext context) {
    controller.value = TextEditingValue(text: initialValue);
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: Theme.of(context).primaryColorDark,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.subhead,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
      autovalidate: autovalidate,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
