import 'package:endava_profile_app/modules/auth/bloc/authentication_bloc.dart';
import 'package:endava_profile_app/modules/login/components/components.dart';
import 'package:endava_profile_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnboardingPageLayout(
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginForm(),
      ),
    );
  }
}
