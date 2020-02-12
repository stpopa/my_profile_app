import 'package:endava_profile_app/modules/home/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCardEmpty extends StatelessWidget {
  String title;
  String iconAsset;
  String description;

  ProfileCardEmpty(Category category, {Key key}) {
    this.title = category.title;
    this.iconAsset = category.iconAsset;
    this.description = category.description;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: Theme.of(context).primaryColorLight,
      margin: EdgeInsets.all(12),
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        onTap: () {
          print('$title tapped');
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 48, 16, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                iconAsset,
                width: 48,
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    description,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Image.asset(
                    'assets/images/arrow-next.png',
                    width: 22,
                    height: 16,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
