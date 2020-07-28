import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends UserDataEvent {
  final String name;

  NameChanged(this.name);
}

class RoleChanged extends UserDataEvent {
  final String role;

  RoleChanged(this.role);
}

class ThumbnailChanged extends UserDataEvent {
  final String thumbnail;

  ThumbnailChanged(this.thumbnail);
}

class SavePressed extends UserDataEvent {}

class ScreenLoaded extends UserDataEvent {}