import 'package:amazon_clone_app/core/error/failure.dart';
import 'package:amazon_clone_app/features/auth/domian/entities/user_entity.dart';
import 'package:amazon_clone_app/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignIn {
  final AuthRepository _repository;
  const SignIn(this._repository);
  Future<Either<Failure, UserEntity>> call(
          String email, String password) async =>
      await _repository.signIn(email: email, password: password);
}
