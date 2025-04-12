import 'package:a2sv_hub/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:a2sv_hub/features/auth/data/datasources/local/auth_local_datasource_impl.dart';
import 'package:a2sv_hub/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:a2sv_hub/features/auth/data/datasources/remote/auth_remote_datasource_impl.dart';
import 'package:a2sv_hub/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:a2sv_hub/features/auth/domain/usecases/get_current_user.dart';
import 'package:a2sv_hub/features/auth/domain/usecases/login.dart';
import 'package:a2sv_hub/features/auth/domain/usecases/logout.dart';
import 'package:a2sv_hub/features/auth/domain/usecases/register.dart';
import 'package:a2sv_hub/features/auth/presentation/Bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future <void> init() async {
  //! Features
  
  //! Feature_#1 (Auth) -----------------------------------------------------

  // Bloc
  serviceLocator.registerFactory(() => AuthBloc(
    login: serviceLocator(),
    register: serviceLocator(),
    logout: serviceLocator(),
    getCurrentUser: serviceLocator(),
  ));

  // Use cases
  serviceLocator.registerLazySingleton(() => Login(serviceLocator()));
  serviceLocator.registerLazySingleton(() => Register(serviceLocator()));
  serviceLocator.registerLazySingleton(() => Logout(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetCurrentUser(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton(() => AuthRepositoryImpl(
    httpClient: serviceLocator(),
    remoteDataSource: serviceLocator(),
    localDataSource: serviceLocator(),
    networkInfo: serviceLocator(),
  ));

  // Data sources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDatasourceImpl(
      httpClient: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDatasourceImpl(
      sharedPreferences: serviceLocator(),
    ),
  );
}