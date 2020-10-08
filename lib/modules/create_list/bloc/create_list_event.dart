import 'package:equatable/equatable.dart';
import 'package:endava_profile_app/models/user.dart';

abstract class CreateListEvent extends Equatable {
  const CreateListEvent();

  @override
  List<Object> get props => [];
}

class ScreenCreated extends CreateListEvent {
  final String listUniqKey;

  ScreenCreated({this.listUniqKey});
}

class NameChanged extends CreateListEvent {
  final String name;

  NameChanged(this.name);
}

class UserAdded extends CreateListEvent {
  final User user;

  UserAdded(this.user);
}

class UserRemoved extends CreateListEvent {
  final User user;

  UserRemoved(this.user);
}

class SavePressed extends CreateListEvent {}