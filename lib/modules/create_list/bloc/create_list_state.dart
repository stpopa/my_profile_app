import 'package:equatable/equatable.dart';
import 'package:endava_profile_app/models/user.dart';
import 'package:endava_profile_app/models/user_list.dart';

class CreateListState extends Equatable {
  const CreateListState();

  factory CreateListState.initial() {
    return CreateListState();
  }

  @override
  List<Object> get props => [];
}

class ListReceived extends CreateListState {
  final UserList list;
  final bool hasUnsavedChanges;
  final bool hasChanges;

  ListReceived({
    this.list,
    this.hasChanges = false,
    this.hasUnsavedChanges = false,
  });

  @override
  List<Object> get props => [list, hasUnsavedChanges, hasChanges];
}

class Networking extends CreateListState {}
