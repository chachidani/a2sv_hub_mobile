import 'package:a2sv_hub/core/error/exception.dart';
import 'package:a2sv_hub/core/error/failure.dart';
import 'package:a2sv_hub/core/network/http.dart';
import 'package:a2sv_hub/core/network/network_info.dart';
import 'package:a2sv_hub/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:a2sv_hub/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:a2sv_hub/features/auth/data/models/authenticated_user_model.dart';
import 'package:a2sv_hub/features/auth/data/models/login_model.dart';
import 'package:a2sv_hub/features/auth/data/models/register_model.dart';
import 'package:a2sv_hub/features/auth/domain/entities/authenticated_user.dart';
import 'package:a2sv_hub/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final HttpClient httpClient;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.httpClient,
  });

  @override
  Future<Either<Failure, AuthenticatedUser>> login({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final accessToken = await remoteDataSource
            .login(LoginModel(email: email, password: password));

        httpClient.authToken = accessToken.token;

        final user = await remoteDataSource.getCurrentUser();
        final authenticatedUser = AuthenticatedUserModel(
          id: user.id,
          name: user.name,
          email: user.email,
          accessToken: accessToken.token,
        );
        await localDataSource.cacheUser(authenticatedUser);
        return Right(authenticatedUser);
      } on ServerException {
        return const Left(ServerFailure('Unable to login'));
      } on AuthenticationException catch (e) {
        return Left(CacheFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUser>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.register(
          RegisterModel(name: name, email: email, password: password),
        );
        final user = await login(email: email, password: password);
        httpClient.authToken = user.fold(
          (l) => '',
          (r) => r.accessToken,
        );
        return user;
      } on ServerException {
        return const Left(ServerFailure('Unable to register'));
      } on AuthenticationException catch (e) {
        return Left(CacheFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUser>> getCurrentUser() async {
    try {
      final user = await localDataSource.getUser();
      httpClient.authToken = user.accessToken;
      return Right(user);
    } on CacheException {
      return Left(AuthFailure.tokenExpired());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        await localDataSource.clear();
        return const Right(unit);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
