import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'endava',
          style: Theme.of(context).textTheme.headline,
        ),
        Text(
          'PROFILE',
          style: Theme.of(context).textTheme.display2,
        ),
      ],
    );
  }
}
