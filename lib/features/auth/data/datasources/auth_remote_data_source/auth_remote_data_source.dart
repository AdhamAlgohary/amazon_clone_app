import 'package:amazon_clone_app/features/auth/data/models/user.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<String> signIn(User user);
  Future<String> signUpNewUser(
      User user);
  Future<User> getUserData();    
}
