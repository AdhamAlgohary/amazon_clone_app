abstract class AuthLocalDataSource {

  Future<bool> setValue<T>({required String key, required T value});
  Future<String?> getValue({required String key});
  void deleteValue({required String key});
}
