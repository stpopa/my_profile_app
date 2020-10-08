import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'create_list_body.dart';

class CreateListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (c) => CreateListBloc(),
        child: CreateListBody(listUniqKey: '142103de5e3a1af4906c'),
      ),
    );
  }
}
