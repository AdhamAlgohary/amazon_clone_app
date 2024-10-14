import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<String> signIn(User user);
  Future<String> signUpNewUser(User user);
  Future<User> getUserData();
}
