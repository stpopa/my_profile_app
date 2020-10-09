import 'package:equatable/equatable.dart';
import 'package:endava_profile_app/models/user_list.dart';

abstract class YourListsEvent extends Equatable {
  const YourListsEvent();

  @override
  List<Object> get props => [];
}

class ScreenCreatedEvent extends YourListsEvent {}

class RemoveListEvent extends YourListsEvent {
  final UserList userList;

  RemoveListEvent({this.userList});
}

class ShareListEvent extends YourListsEvent {
  final UserList userList;

  ShareListEvent({this.userList});
}
