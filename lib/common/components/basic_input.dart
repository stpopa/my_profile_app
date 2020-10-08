import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/palette.dart';

class BasicInput extends StatefulWidget {
  final String hintText;
  final String initialString;
  final bool shouldSelectAll;
  final ValueChanged<String> onChanged;

  BasicInput({
    this.hintText,
    this.onChanged,
    this.initialString,
    this.shouldSelectAll = false,
  });

  @override
  _BasicInputState createState() => _BasicInputState();
}

class _BasicInputState extends State<BasicInput> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialString);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: true,
      keyboardType: TextInputType.text,
      maxLines: null,
      controller: _controller,
      onChanged: widget.onChanged,
      cursorColor: Palette.cinnabar,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Palette.black,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Palette.gainsboro,
        ),
        hintText: widget.hintText,
        border: InputBorder.none,
      ),
    );
  }
}
