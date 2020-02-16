import 'package:endava_profile_app/modules/common/constants/dimens.dart';
import 'package:endava_profile_app/modules/home/components/section_content.dart';
import 'package:endava_profile_app/modules/home/models/content_item.dart';
import 'package:endava_profile_app/modules/home/models/placeholder_item.dart';
import 'package:endava_profile_app/modules/home/models/section_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'section_placeholder.dart';

class SectionCard extends StatelessWidget {
  final SectionListItem section;

  SectionCard({
    this.section,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text('Tap'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.spacingSmall,
        ),
        child: Card(
          elevation: Dimens.cardElevation,
          child: Container(
            width: double.infinity,
            height: Dimens.sectionCardHeight,
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (section is ContentItem) {
      return SectionContent(
        content: section as ContentItem,
      );
    }

    return SectionPlaceholder(
      placeholder: section as PlaceholderItem,
    );
  }
}
