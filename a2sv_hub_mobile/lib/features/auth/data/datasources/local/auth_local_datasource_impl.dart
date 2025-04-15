import 'dart:convert';

import '../../../../../core/error/exception.dart';
import 'auth_local_datasource.dart';
import '../../models/authenticated_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasourceImpl implements AuthLocalDataSource {
  final authCacheKey = 'AUTH';

  final SharedPreferences _sharedPreferences;
  AuthLocalDatasourceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<void> cacheUser(AuthenticatedUserModel user) {
    return _sharedPreferences.setString(
        authCacheKey, jsonEncode(user.toJson()));
  }

  @override
  Future<void> clear() {
    return _sharedPreferences.remove(authCacheKey);
  }

  @override
  Future<AuthenticatedUserModel> getUser() async {
    final userJson = _sharedPreferences.getString(authCacheKey);
    if (userJson == null) {
      throw const CacheException(message: 'User not found in cache');
    } else {
      return AuthenticatedUserModel.fromJson(jsonDecode(userJson));
    }
  }
}
