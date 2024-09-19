import 'package:amazon_clone_app/features/auth/data/models/user.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<User> signIn(User user);
  Future<String> signUpNewUser(
      User user);
}
