import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/palette.dart';

class BasicInput extends StatefulWidget {
  final String hintText;
  final String initialString;
  final bool shouldSelectAll;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;

  BasicInput({
    this.hintText,
    this.onChanged,
    this.onEditingComplete,
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
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      cursorColor: Palette.cinnabar,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Palette.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Palette.gainsboro,
        ),
        hintMaxLines: 20,
        hintText: widget.hintText,
        border: InputBorder.none,
      ),
    );
  }
}
