import 'package:endava_profile_app/modules/home/models/content_item.dart';
import 'package:flutter/material.dart';

class SectionContent extends StatelessWidget {
  final ContentItem content;

  SectionContent({
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        content.value,
      ),
    );
  }
}
