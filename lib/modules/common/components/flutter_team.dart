import 'package:flutter/material.dart';
import '../constants/palette.dart';

class FlutterTeam extends StatefulWidget {
  final GestureTapCallback onTap;

  FlutterTeam({this.onTap});

  @override
  _FlutterTeamState createState() => _FlutterTeamState();
}

class _FlutterTeamState extends State<FlutterTeam> {
  final defaultOpacity = 0.8;
  var _opacity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTapCancel: _tapCancel,
      child: Opacity(
        opacity: _opacity ?? defaultOpacity,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 25, 0, 40),
          child: Column(
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 0.3,
                child: Image.asset('assets/images/snail_project.png'),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "With ",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "♥",
                      style: TextStyle(
                        fontSize: 24,
                        color: Palette.cinnabar,
                      ),
                    ),
                    Text(
                      " from endava's flutter team",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _tapDown(TapDownDetails details) {
    setState(() {
      _opacity = 1.0;
    });
  }

  _tapUp(TapUpDetails details) {
    setState(() {
      _opacity = defaultOpacity;
    });

    widget.onTap();
  }

  _tapCancel() {
    setState(() {
      _opacity = defaultOpacity;
    });
  }
}