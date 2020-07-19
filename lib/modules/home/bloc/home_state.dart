import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../models/user.dart';
import '../../../models/item.dart';

class HomeState extends Equatable {

  const HomeState();

  factory HomeState.initial() {
    return HomeState();
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''HomeState{}''';
  }
}

class HomeSuccessResponse extends HomeState {
  final User currentUser;
  final List<Item> items;

  HomeSuccessResponse({this.currentUser, this.items}): super();
}

class HomeLoading extends HomeState {
  HomeLoading(): super();
}
