import 'package:endava_profile_app/modules/home/models/content_item.dart';
import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/dimens.dart';

class UserContent extends StatelessWidget {
  final UserItem item;

  UserContent({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(Dimens.spacingLarge),
            child: Container(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: NetworkImage(item.user.thumbnail),
                  ),
                  SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.user.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: Dimens.spacingSmall),
                        Text(
                          item.user.role,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 0,
          child: Container(
            width: 52,
            height: 27,
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )),
          ),
        ),
      ],
    );
  }
}
