import 'package:flutter/material.dart';
import 'bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:endava_profile_app/common/constants.dart';

class AuthenticationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context)..add(AppStartedEvent());

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
      Future.delayed(Duration(milliseconds: 10), () {
        if (state is AuthenticatedState)
          Navigator.of(context)
              .pushReplacementNamed(AppRoute.of(AppScreen.home));
        else if (state is UnauthenticatedState)
          Navigator.of(context)
              .pushReplacementNamed(AppRoute.of(AppScreen.login));
      });

      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Palette.cinnabar),
          strokeWidth: 6,
        ),
      );
    });
  }
}
