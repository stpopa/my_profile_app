import 'package:endava_profile_app/modules/domain_exp/widgets/sized_icon.dart';
import 'package:endava_profile_app/modules/home/models/content_item.dart';
import 'package:flutter/material.dart';
import 'package:endava_profile_app/common/constants/dimens.dart';

class DomainExperienceContent extends StatelessWidget {
  final DomainExperienceItem content;

  DomainExperienceContent({
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24.0, top: 24.0, bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedIcon.asset('assets/images/experience.png'),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${this.content.title}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                    '${this.content.value.toUpperCase()}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                  ),
                ),
              ),
              Image.asset(
                'assets/images/arrow-next.png',
                width: Dimens.sectionArrowWidth,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
