import 'package:flutter/material.dart';
import 'package:endava_profile_app/models/user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:endava_profile_app/common/constants/palette.dart';

class UserCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;
  final ValueChanged<bool> onSelectionChanged;

  UserCard({this.user, this.onTap, this.onTapDelete, this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionExtentRatio: 0.15,
      actionPane: SlidableBehindActionPane(),
      secondaryActions: [
        Container(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Palette.wildSand,
              ),
              onPressed: onTapDelete,
            ),
          ),
          height: 70,
          decoration: BoxDecoration(
              color: Palette.cinnabar,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
        ),
      ],
      child: Card(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user.thumbnail),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Palette.black),
                    ),
                    Text(
                      user.role,
                      style: TextStyle(fontSize: 14, color: Palette.darkGray),
                    ),
                  ],
                ),
              ),
              Container(
                child: Switch(
                  value: user.selected,
                  onChanged: onSelectionChanged,
                  activeColor: Palette.wildSand,
                  activeTrackColor: Palette.cinnabar,
                ),
              ),
            ],
          ),
        ),
        elevation: 3,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
