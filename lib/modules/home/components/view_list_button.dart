import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';

class ViewListButton extends StatelessWidget {
  final VoidCallback onTap;

  ViewListButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: IconButton(
            icon: Icon(Icons.list),
            onPressed: onTap,
            iconSize: 32,
            color: Palette.cinnabar,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            border: Border.all(color: Palette.gainsboro, width: 7),
          ),
        ),
        SizedBox(height: 22),
        Text("My lists"),
      ],
    );
  }
}
