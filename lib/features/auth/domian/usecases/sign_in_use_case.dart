import 'package:amazon_clone_app/core/error/failure.dart';
import 'package:amazon_clone_app/features/auth/domian/entities/user_entity.dart';
import 'package:amazon_clone_app/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase {
  final AuthRepository _repository;
  const SignInUseCase(this._repository);
  Future<Either<Failure, UserEntity>> call(
          String email, String password) async =>
      await _repository.signIn(email: email, password: password);
}
