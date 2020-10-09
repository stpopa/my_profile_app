import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/palette.dart';

class AddButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  AddButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  size: 32,
                  color: Palette.darkGray,
                ),
                SizedBox(width: 3),
                Text(title, style: TextStyle(
                    color: Palette.darkGray,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
