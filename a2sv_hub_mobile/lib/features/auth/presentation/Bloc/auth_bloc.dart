import 'package:a2sv_hub/core/usecase.dart';
import 'package:a2sv_hub/features/auth/domain/usecases/get_current_user.dart';
import 'package:a2sv_hub/features/auth/domain/usecases/login.dart';
import 'package:a2sv_hub/features/auth/domain/usecases/logout.dart';
import 'package:a2sv_hub/features/auth/domain/usecases/register.dart';
import 'package:a2sv_hub/features/auth/presentation/Bloc/auth_event.dart';
import 'package:a2sv_hub/features/auth/presentation/Bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Register register;
  final Logout logout;
  final GetCurrentUser getCurrentUser;

  AuthBloc({
    required this.login,
    required this.register,
    required this.logout,
    required this.getCurrentUser,
  }) : super(const AuthInitial()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthRegisterEvent>(_onRegister);
    on<AuthLogoutEvent>(_onLogout);
    on<AuthGetCurrentUserEvent>(_onGetCurrentUser);
  }
  void _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoginLoading());
    final result =
        await login(LoginParams(email: event.email, password: event.password));
    result.fold(
      (failure) => emit(AuthLoginFailure(failure.message)),
      (user) => emit(AuthLoginSuccess(user)),
    );
  }

  void _onRegister(AuthRegisterEvent event, Emitter<AuthState> emit) async {
    emit(const AuthRegisterLoading());
    final result = await register(RegisterParams(
        name: event.name, email: event.email, password: event.password));
    result.fold(
      (failure) => emit(AuthRegisterFailure(failure.message)),
      (user) => emit(AuthRegisterSuccess(user)),
    );
  }

  void _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLogoutLoading());
    final result = await logout(NoParams());
    result.fold(
      (failure) => emit(AuthLogoutFailure(failure.message)),
      (_) => emit(const AuthLogoutSuccess()),
    );
  }

  void _onGetCurrentUser(
      AuthGetCurrentUserEvent event, Emitter<AuthState> emit) async {
    emit(const AuthGetUserLoading());
    final result = await getCurrentUser(NoParams());
    result.fold(
      (failure) => emit(AuthGetUserFailure(failure.message)),
      (user) => emit(AuthGetUserSuccess(user)),
    );
  }
}
