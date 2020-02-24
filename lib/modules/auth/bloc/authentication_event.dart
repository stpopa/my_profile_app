import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoggedInEvent extends AuthenticationEvent {
  final String token;

  LoggedInEvent(this.token);

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOutEvent extends AuthenticationEvent {}

class AuthenticationLoadingEvent extends AuthenticationEvent {}

class AppStartedEvent extends AuthenticationEvent {}
