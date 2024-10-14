import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/domain/domain_import_packages.dart';

import 'package:dartz/dartz.dart';

class SignUpNewUserUseCase {
  final AuthRepository _repository;

  const SignUpNewUserUseCase(this._repository);
  
  Future<Either<Failure, String>> call(
          UserEntity userEntity) async =>
      await _repository.signUpNewUser(
          userEntity: userEntity);
}
