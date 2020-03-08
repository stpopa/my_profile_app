import 'package:endava_profile_app/modules/home/models/content_item.dart';
import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';

class SkillsContent extends StatelessWidget {
  final SkillsItem content;

  SkillsContent({
    this.content,
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
            padding: const EdgeInsets.fromLTRB(
              Dimens.spacingLarge,
              Dimens.spacingLarge,
              Dimens.spacingLarge + 20,
              Dimens.spacingLarge,
            ),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    content.icon,
                    width: Dimens.sectionContentIconWidth,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          content.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 80,
                          child: Stack(
                            overflow: Overflow.clip,
                            children: <Widget>[
                              Wrap(
                                spacing: 5,
                                runSpacing: -10,
                                direction: Axis.horizontal,
                                children: _chips(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
        Positioned(
          bottom: 14,
          right: 16,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/arrow-next.png',
              width: Dimens.sectionArrowWidth,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _chips() {
    return content.skills
        .map(
          (skill) => Chip(
            label: Text(
              skill.toString(),
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Palette.cinnabar,
          ),
        )
        .toList();
  }
}
