import 'package:equatable/equatable.dart';
import '../../../common/constants.dart';
import 'package:flutter/material.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SectionSelected extends HomeEvent {
  final AppScreen category;

  SectionSelected({this.category});

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'CategorySelected { category: $category }';
}

class ScreenLoaded extends HomeEvent {}