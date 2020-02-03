import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {}

class PasswordChanged extends LoginEvent {}

class FormSubmitted extends LoginEvent {
  final String email;
  final String password;

  const FormSubmitted({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'FormSubmitted { email: $email, password: $password }';
}
