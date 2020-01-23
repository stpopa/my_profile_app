import 'package:flutter/material.dart';
import '../../models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Widget accessory;

  UserCard({this.user, this.accessory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: 55,
                height: 55,
                child: PhysicalModel(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(user.avatarUrl),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              accessory,
            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _getTitle(),
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  _getSubtitle() ?? 'Contributor',
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ],
            ),
          ),
          user.contributions > 0
              ? Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    child: Text(
                      user.contributions.toString(),
                      style: Theme.of(context).textTheme.display2,
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              )
              : SizedBox(),
        ],
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)
          ]),
    );
  }

  String _getTitle() {
    return user.name ?? user.login;
  }

  String _getSubtitle() {
    return user.company ?? user.location;
  }
}
