import 'domain_exp_bloc.dart';
import 'package:flutter/material.dart';

class DomainExpProvider extends InheritedWidget {
  final Key key;
  final Widget child;

  final _bloc = DomainExpBloc();

  DomainExpProvider({@required this.key, @required this.child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => false;

  static DomainExpBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DomainExpProvider>()
        ._bloc;
  }
}
