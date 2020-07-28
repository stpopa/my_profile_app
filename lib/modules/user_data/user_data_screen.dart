import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_data_body.dart';
import 'bloc/bloc.dart';

class UserDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserDataBloc(),
        child: UserDataBody(),
      ),
    );
  }
}
