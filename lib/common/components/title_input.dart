import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/palette.dart';

class TitleInput extends StatefulWidget {
  final String hintText;
  final String initialString;
  final bool shouldSelectAll;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;

  TitleInput({
    this.hintText,
    this.onChanged,
    this.onEditingComplete,
    this.initialString,
    this.shouldSelectAll = false,
  });

  @override
  _TitleInputState createState() => _TitleInputState();
}

class _TitleInputState extends State<TitleInput> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialString);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      enableInteractiveSelection: true,
      keyboardType: TextInputType.text,
      maxLines: null,
      controller: _controller,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      cursorColor: Palette.cinnabar,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Palette.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Palette.gainsboro,
        ),
        hintMaxLines: 20,
        hintText: widget.hintText,
        border: InputBorder.none,
      ),
    );
  }
}
