import 'package:endava_profile_app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/profile.dart';
import 'home_bloc.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  final Profile profile;

  const HomeScreen({Key key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppTheme(
        child: Provider<HomeBloc>(
          create: (context) => HomeBloc(),
          dispose: (_, bloc) => bloc.dispose(),
          child: HomeBody(),
        ),
      ),
    );
  }
}
