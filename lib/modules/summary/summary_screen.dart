import 'package:endava_profile_app/modules/common/components/category_header.dart';
import 'package:endava_profile_app/modules/common/components/content_input.dart';
import 'package:endava_profile_app/modules/common/components/example_expandable.dart';
import 'package:endava_profile_app/modules/summary/bloc/summary_content_bloc.dart';
import 'package:endava_profile_app/themes/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryScreen extends StatelessWidget {
  static final _title = 'Summary';
  static final _subtitle =
      'One or two paragraphs summarising the person’s key achievements and skills.';
  static final _exampleTitle = 'Example';
  static final _exampleText =
  '''Lea has over 7 years of combined experience in software development and project delivery, technical consultancy and training. She is driven by a desire to deliver maximum business value through implementing high-quality solutions by applying industry best practices pragmatically.
She is a diligent, pro-active and business-oriented problem-solver with a proven aptitude and versatility in a range of roles - as business analyst, developer, technical lead, development manager, mentor, consultant and technical trainer.
Lea is also an advocate of open communication, team collaboration and 
continuous development, both personally and professionally.''';
  static final _contentHintText = 'Add summary text';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MainTheme(
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => SummaryContentBloc(),
              child: Column(
                children: <Widget>[
                  CategoryHeader(
                    title: _title,
                    subtitle: _subtitle,
                  ),
                  ExampleExpandable(
                      exampleTitle: _exampleTitle,
                      exampleText: _exampleText
                  ),
                  ContentInput(hintText: _contentHintText),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
