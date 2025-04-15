import 'dart:convert';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/exception.dart';
import '../../../../../core/network/http.dart';
import 'auth_remote_datasource.dart';
import '../../models/login_model.dart';
import '../../models/register_model.dart';
import '../../models/user_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final HttpClient httpClient;
  final String _baseUrl;

  AuthRemoteDatasourceImpl({required this.httpClient})
      : _baseUrl = '$baseUrl/auth';

  @override
  Future<AccessToken> login(LoginModel loginModel) async {
    final response = await httpClient.post(
      '$_baseUrl/login',
      loginModel.toJson(),
    );
    if (response.statusCode == 201) {
      return AccessToken.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw AuthenticationException.invalidEmailAndPasswordCombination();
    } else {
      throw ServerException(message: response.body);
    }
  }

  @override
  Future<UserModel> register(RegisterModel registerModel) async {
    final response = await httpClient.post(
      '$_baseUrl/register',
      registerModel.toJson(),
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 409) {
      throw AuthenticationException.emailAlreadyInUse();
    } else {
      throw ServerException(message: response.body);
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await httpClient.get('$_baseUrl/users/me');
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw AuthenticationException.tokenExpired();
    } else {
      throw ServerException(message: response.body);
    }
  }
}
