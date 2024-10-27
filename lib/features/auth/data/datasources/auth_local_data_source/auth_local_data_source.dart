import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';

abstract class AuthLocalDataSource {
  Future<void> setValue<T>({
    required String key,
    required T value,
  });
  User? getValue({
    required String key,
  });
  Future<void> deleteValue({required String key});
}
