import 'package:amazon_clone_app/features/auth/data/models/user.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<User> signIn({required String email, required String password});
  Future<User> signUpNewUser(
      {required String name, required String email, required String password});
}
