import 'package:endava_profile_app/modules/professional_experience/professional_experience_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

class ProfessionalExperienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfessionalExperienceBloc(),
        child: ProfessionalExperienceBody(),
      ),
    );
  }
}