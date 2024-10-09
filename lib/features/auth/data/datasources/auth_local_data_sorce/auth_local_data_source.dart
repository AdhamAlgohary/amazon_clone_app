abstract class AuthLocalDataSource {
<<<<<<< HEAD

=======
>>>>>>> refactor-code-and-architcture-branch
  Future<bool> setValue<T>({required String key, required T value});
  Future<String?> getValue({required String key});
  void deleteValue({required String key});
}
