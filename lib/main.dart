import 'common/constants.dart';
import 'modules/auth/bloc/authentication_state.dart';
import 'modules/auth/bloc/authentication_bloc.dart';
import 'modules/auth/bloc/authentication_event.dart';
import 'modules/contributors/contributors_screen.dart';
import 'modules/summary/summary_screen.dart';
import 'modules/core_skills/core_skills_screen.dart';
import 'modules/domain_exp/domain_exp_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc()
          ..add(AppStartedEvent());
      },
      child: EndavaProfileApp()));
}

class EndavaProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Endava Profile',
      routes: {
        AppRoute.of(AppScreen.login): (c) => LoginScreen(),
        AppRoute.of(AppScreen.contributors): (c) =>
            ContributorsScreen(repository: 'stpopa/endava_profile_app'),
        AppRoute.of(AppScreen.coreSkills): (c) => CoreSkillsScreen(),
        AppRoute.of(AppScreen.domainExperience): (c) =>
            DomainExperienceScreen(),
        AppRoute.of(AppScreen.summary): (c) => SummaryScreen(),
      },
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            return HomeScreen();
          }
          return LoginScreen();
        },
      ),
    );
  }
}
