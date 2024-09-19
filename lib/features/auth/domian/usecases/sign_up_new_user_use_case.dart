import 'package:amazon_clone_app/core/error/failure.dart';
import 'package:amazon_clone_app/features/auth/domian/entities/user_entity.dart';
import 'package:amazon_clone_app/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpNewUserUseCase {
  final AuthRepository _repository;

  const SignUpNewUserUseCase(this._repository);
  
  Future<Either<Failure, String>> call(
          UserEntity user) async =>
      await _repository.signUpNewUser(
          userEntity: user);
}
