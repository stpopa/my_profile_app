import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'search_user_body.dart';

class SearchUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (c) => SearchUserBloc(),
          child: SearchUserBody(),
        ),
      ),
    );
  }
}
