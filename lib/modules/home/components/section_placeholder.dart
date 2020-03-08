import 'package:endava_profile_app/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/home/models/placeholder_item.dart';
import 'package:flutter/material.dart';

class SectionPlaceholder extends StatelessWidget {
  final PlaceholderItem placeholder;

  SectionPlaceholder({
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Dimens.spacingMedium,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            placeholder.icon,
            width: Dimens.sectionIconWidth,
          ),
          SizedBox(height: Dimens.spacingXSmall),
          Text(
            placeholder.title,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Dimens.spacingXSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'ADD NOW',
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(fontSize: Dimens.fontSizeMedium),
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
