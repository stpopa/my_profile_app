import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/palette.dart';

class SelectableChip extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final ValueChanged<bool> selectionChanged;

  SelectableChip({this.title, this.subtitle, this.selected, this.selectionChanged});

  @override
  _SelectableChipState createState() => _SelectableChipState();
}

class _SelectableChipState extends State<SelectableChip> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.selected;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 3, 3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isSelected ? Palette.cinnabar : Colors.black38,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: (){
            setState(() {
              _isSelected = !_isSelected;

              if (widget.selectionChanged != null)
                widget.selectionChanged(_isSelected);
            });
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                Text(widget.subtitle, style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
