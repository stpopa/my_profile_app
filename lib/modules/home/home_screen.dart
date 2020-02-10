import 'package:endava_profile_app/modules/common/components/progress_profile_indicator.dart';
import 'package:endava_profile_app/modules/common/components/default_section_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 24, 12.0, 24),
            child: Column(
              children: [
                Image.asset("assets/images/endava-logo.png", height: 40),
                SizedBox(height: 40),
                ProgressProfileIndicator(value: 0, size: 104, onPressed: () {}),
                SizedBox(height: 40),
                Column(
                  children: _getSectionsList()
                      .map((card) => Padding(
                          child: card, padding: EdgeInsets.only(bottom: 12)))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DefaultSectionCard> _getSectionsList() {
    return [
      DefaultSectionCard("Name and role", "user.png", () {}),
      DefaultSectionCard("Summary", "summary.png", () {}),
      DefaultSectionCard("Domain experience", "experience.png", () {}),
      DefaultSectionCard("Core skills", "skills.png", () {}),
      DefaultSectionCard("Education and training", "education.png", () {}),
      DefaultSectionCard("Professional experience", "portfolio.png", () {}),
    ];
  }
}
