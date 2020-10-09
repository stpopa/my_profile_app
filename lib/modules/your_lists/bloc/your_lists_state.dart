import 'package:equatable/equatable.dart';
import 'package:endava_profile_app/models/user_list.dart';

class YourListsState extends Equatable {
  const YourListsState();

  factory YourListsState.initial() {
    return YourListsState();
  }

  @override
  List<Object> get props => [];
}

class ListReceived extends YourListsState {
  final List<UserList> userLists;

  ListReceived({this.userLists});
}
class Networking extends YourListsState {}

