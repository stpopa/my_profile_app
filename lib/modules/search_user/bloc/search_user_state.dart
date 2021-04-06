import 'package:equatable/equatable.dart';
import 'package:endava_profile_app/models/user.dart';

class SearchUserState extends Equatable {
  const SearchUserState();

  factory SearchUserState.initial() {
    return SearchUserState();
  }

  @override
  List<Object> get props => [];
}


class UsersReceived extends SearchUserState {
  final List<User> users;

  UsersReceived({this.users});
}

class Networking extends SearchUserState {}