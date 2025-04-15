import 'package:a2sv_hub/features/auth/domain/entities/authenticated_user.dart';
import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

//  login states
class AuthLoginLoading extends AuthState {
  const AuthLoginLoading();
}

class AuthLoginSuccess extends AuthState {
  final AuthenticatedUser user;
  const AuthLoginSuccess(this.user);
}

class AuthLoginFailure extends AuthState {
  final String message;

  const AuthLoginFailure(this.message);
}

// register states
class AuthRegisterLoading extends AuthState {
  const AuthRegisterLoading();
}

class AuthRegisterSuccess extends AuthState {
  final AuthenticatedUser user;
  const AuthRegisterSuccess(this.user);
}

class AuthRegisterFailure extends AuthState {
  final String message;

  const AuthRegisterFailure(this.message);
}

// logout states
class AuthLogoutLoading extends AuthState {
  const AuthLogoutLoading();
}

class AuthLogoutSuccess extends AuthState {
  const AuthLogoutSuccess();
}

class AuthLogoutFailure extends AuthState {
  final String message;

  const AuthLogoutFailure(this.message);
}

// get user states
class AuthGetUserLoading extends AuthState {
  const AuthGetUserLoading();
}

class AuthGetUserSuccess extends AuthState {
  final AuthenticatedUser user;
  const AuthGetUserSuccess(this.user);
}

class AuthGetUserFailure extends AuthState {
  final String message;

  const AuthGetUserFailure(this.message);
}
