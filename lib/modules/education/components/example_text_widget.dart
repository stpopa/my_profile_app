import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/education/models/example_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleItemText extends StatelessWidget {
  final ExampleItemModel data;

  ExampleItemText({this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          data.title,
          style: TextStyle(fontSize: Dimens.fontSizeLarge, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: Dimens.spacingXXSmall),
        Text(
          data.subTitle,
          style: TextStyle(fontSize: Dimens.fontSizeMedium, color: Colors.black),
        ),
        SizedBox(height: Dimens.spacingMedium),
      ],
    );
  }
}
