import 'package:equatable/equatable.dart';
import 'package:endava_profile_app/models/user.dart';

class UserDataState extends Equatable {
  const UserDataState();

  factory UserDataState.initial() {
    return UserDataState();
  }

  @override
  List<Object> get props => [];
}

class UserDataReceived extends UserDataState {
  final User user;
  final bool hasChanged;
  final bool hasUnsavedChanges;

  UserDataReceived({
    this.user,
    this.hasChanged = false,
    this.hasUnsavedChanges = false,
  });

  @override
  List<Object> get props => [user, hasChanged, hasUnsavedChanges];
}
