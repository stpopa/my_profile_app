import 'package:endava_profile_app/modules/home/models/content_item.dart';
import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/common/constants/palette.dart';

class PortfolioContent extends StatelessWidget {
  final PortfolioItem content;

  PortfolioContent({
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        content.icon,
                        width: Dimens.sectionContentIconWidth,
                      ),
                      Expanded(
                        child: Container(
                          width: 2,
                          color: Palette.cinnabar,
                        ),
                      ),
                    ],
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
                        SizedBox(height: 20),
                        Text(
                          content.value.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
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
}
