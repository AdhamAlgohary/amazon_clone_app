import 'package:amazon_clone_app/features/auth/data/datasources/auth_local_data_sorce/auth_local_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/models/user.dart';

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceImplWithSharedPreferences
    implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  const AuthLocalDataSourceImplWithSharedPreferences(
      {required this.sharedPreferences});
  @override
  Future<Unit> cacheUserData(String keyForCachedData, User userData) {
    Map<String, dynamic> userDataToJson = userData.toJson();
    sharedPreferences.setString(keyForCachedData, json.encode(userDataToJson));
    return Future.value(unit);
  }
}
