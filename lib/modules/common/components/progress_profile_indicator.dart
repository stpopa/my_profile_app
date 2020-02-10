import 'package:endava_profile_app/modules/common/components/progress/circle_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressProfileIndicator extends StatelessWidget {
  final double value;
  final double size;
  final VoidCallback onPressed;

  const ProgressProfileIndicator({
    @required this.size,
    @required this.value,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: this.size,
          width: this.size,
          child: Stack(
            children: <Widget>[
              CircleProgressBar(
                  foregroundColor: Theme.of(context).accentColor,
                  defaultForegroundColor: Color.fromRGBO(218, 218, 218, 1),
                  value: this.value,
                  height: this.size,
                  width: this.size),
              Center(
                child: SizedBox(
                  width: this.size - 25,
                  height: this.size - 25,
                  child: RawMaterialButton(
                    onPressed: value < 1 ? null : () => this.onPressed(),
                    shape: new CircleBorder(),
                    child: Icon(
                      value < 1 ? Icons.navigate_next : Icons.done,
                      color: Colors.white,
                      size: this.size * 0.5,
                    ),
                    fillColor: value == 0
                        ? Color.fromRGBO(218, 218, 218, 1)
                        : Theme.of(context).accentColor,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Text(
            value < 1 ? "Preview" : "Preview and publish",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
