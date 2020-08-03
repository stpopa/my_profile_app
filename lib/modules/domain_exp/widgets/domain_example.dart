import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';
import 'domain_example_header.dart';

class Example extends StatefulWidget {
  final String title;
  final String details;

  Example({
    @required this.title,
    @required this.details,
  });

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  var isExpanded = false;

  void _expand() => setState(() {
        isExpanded = !isExpanded;
      });

  final _exampleTitleStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Palette.black,
  );

  static final _exampleBodyStyle = TextStyle(
    fontSize: 16.0,
    color: Palette.black,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _expand,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.spacingSmall),
        child: Column(
          children: [
            ExampleHeader(),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.spacingMedium,
                  left: Dimens.spacingHuge,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: _exampleTitleStyle,
                    ),
                    SizedBox(height: Dimens.spacingXSmall),
                    Text(
                      widget.details,
                      style: _exampleBodyStyle,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
