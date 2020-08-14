import 'package:endava_profile_app/modules/common/category_bloc/category_bloc.dart';
import 'package:endava_profile_app/modules/common/category_bloc/category_event.dart';
import 'package:endava_profile_app/modules/home/models/home_category.dart';
import 'package:endava_profile_app/modules/summary/summary_screen_body.dart';
import 'package:endava_profile_app/themes/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MainTheme(
          child: BlocProvider(
            create: (context) =>
                CategoryBloc(HomeCategory.summary)..add(CategoryLoading()),
            child: SummaryScreenBody(),
          ),
        ),
      ),
    );
  }
}
