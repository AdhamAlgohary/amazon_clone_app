import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalDataSourceImplWithHive implements AuthLocalDataSource {
  static late Box hiveBox;
  static late AuthLocalDataSourceImplWithHive _authLocalDataSourceImplWithHive;

  static AuthLocalDataSourceImplWithHive init() {
    _authLocalDataSourceImplWithHive = AuthLocalDataSourceImplWithHive();
    return _authLocalDataSourceImplWithHive;
  }

  @override
  Future<void> deleteValue({required String key}) async {
    return await hiveBox.delete(key);
  }

  @override
  User? getValue({
    required String key,
  }) {
    return hiveBox.get(key);
  }

  @override
  Future<void> setValue<T>({
    required String key,
    required T value,
  }) async {
    return await hiveBox.put(key, value);
  }
}
