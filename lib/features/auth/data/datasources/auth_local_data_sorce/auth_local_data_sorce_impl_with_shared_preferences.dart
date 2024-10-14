import 'package:amazon_clone_app/features/auth/data/datasources/auth_local_data_sorce/auth_local_data_source.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSourceWithSharedPreferences implements AuthLocalDataSource {
  static late SharedPreferences _sharedPreferences;
  static late AuthLocalDataSourceWithSharedPreferences
      _authLocalDataSourceWithSharedPreferences;

  static AuthLocalDataSourceWithSharedPreferences init() {
    _authLocalDataSourceWithSharedPreferences =
        AuthLocalDataSourceWithSharedPreferences();
    return _authLocalDataSourceWithSharedPreferences;
  }

  Future<SharedPreferences> _initSharedPrefernces() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences;
  }

  
  @override
  Future<bool> setValue<T>({required String key, required T value}) async {
    await _initSharedPrefernces();

    switch (value) {
      case String _:
        return await _sharedPreferences.setString(key, value);
      case int _:
        return await _sharedPreferences.setInt(key, value);
      case double _:
        return await _sharedPreferences.setDouble(key, value);
      case bool _:
        return await _sharedPreferences.setBool(key, value);
      default:
        return Future.value(false);
    }
  }

  @override
  Future<String?> getValue({required String key}) async {
    await _initSharedPrefernces();
    String? value;
    value =_sharedPreferences.getString(key);
    return value;
  }

  @override
  void deleteValue({required String key}) async {
    await _initSharedPrefernces();

    _sharedPreferences.remove(key);
  }
}
