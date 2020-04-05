import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/common/constants/strings.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_bloc.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_state.dart';
import 'package:endava_profile_app/modules/common/category_components/category_header.dart';
import 'package:endava_profile_app/modules/common/category_components/category_content_input.dart';
import 'package:endava_profile_app/modules/common/category_components/category_example_expandable.dart';
import 'package:endava_profile_app/modules/home/models/home_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryScreenBody extends StatefulWidget {
  @override
  _SummaryScreenBodyState createState() => _SummaryScreenBodyState();
}

class _SummaryScreenBodyState extends State<SummaryScreenBody> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Palette.cinnabar),
              strokeWidth: 6,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Column(
                children: <Widget>[
                  CategoryHeader(
                    title: HomeCategoryData.titleFor(HomeCategory.summary),
                    subtitle: Strings.summarySubtitle,
                  ),
                  CategoryExampleExpandable(
                      exampleTitle: Strings.summaryExampleTitle,
                      exampleText: Strings.summaryExampleText),
                  CategoryContentInput(hintText: Strings.summaryContentHintText),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
