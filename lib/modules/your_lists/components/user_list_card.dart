import 'package:flutter/material.dart';
import 'package:endava_profile_app/models/user_list.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:endava_profile_app/common/constants/palette.dart';

class UserListCard extends StatelessWidget {
  final UserList userList;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;
  final VoidCallback onTapShare;

  UserListCard({this.userList, this.onTap, this.onTapDelete, this.onTapShare});

  @override
  Widget build(BuildContext context) {
    final selectedUsers = userList.users.where((u) => u.selected);
    final allUsers = userList.users;

    return Slidable(
      actionExtentRatio: 0.30,
      actionPane: SlidableBehindActionPane(),
      secondaryActions: [
        Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                height: 72,
                width: 80,
                decoration: BoxDecoration(
                    color: Palette.cinnabar,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )),
              ),
            ),
            Positioned(
              top: 0,
              left: -20,
              child: Container(
                padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Palette.wildSand,
                    ),
                    onPressed: onTapShare,
                  ),
                ),
                height: 72,
                width: 80,
                decoration: BoxDecoration(
                  color: Palette.rottenTomato,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
      child: Card(
        elevation: 3,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Palette.cinnabar,
                child: Text(
                  "${selectedUsers.length}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Palette.wildSand),
                ),
              ),
              title: Text(userList.name),
              subtitle: Text(
                  "${selectedUsers.length} out of ${allUsers.length} people selected in this list"),
            ),
          ),
        ),
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
