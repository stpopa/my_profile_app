import 'package:equatable/equatable.dart';

abstract class SearchUserEvent extends Equatable {
  const SearchUserEvent();

  @override
  List<Object> get props => [];
}

class SearchStringChanged extends SearchUserEvent {
  final String searchString;

  SearchStringChanged(this.searchString);
}