import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class AuthRegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const AuthRegisterEvent(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, email, password];
}

class AuthLogoutEvent extends AuthEvent {
  const AuthLogoutEvent();
}

class AuthGetCurrentUserEvent extends AuthEvent {
  const AuthGetCurrentUserEvent();
}
