import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfessionalExperienceExample extends StatefulWidget {
  @override
  _ProfessionalExperienceExampleState createState() =>
      _ProfessionalExperienceExampleState();
}

class _ProfessionalExperienceExampleState
    extends State<ProfessionalExperienceExample> with TickerProviderStateMixin {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/quote.png',
                    height: 24,
                    width: 29,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Example",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Transform.rotate(
                    angle: (isVisible ? 180 : 0) * math.pi / 180,
                    child: Image.asset(
                      'assets/images/dropdown.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              Visibility(
                child: Text('some example'),
                visible: isVisible,
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ));
  }
}
