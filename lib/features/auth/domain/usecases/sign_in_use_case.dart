import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/domain/domain_import_packages.dart';

import 'package:dartz/dartz.dart';

class SignInUseCase {
  final AuthRepository _repository;

  const SignInUseCase(this._repository);

  Future<Either<Failure, Unit>> call(
          UserEntity userEntity) async =>
      await _repository.signIn(userEntity:userEntity );
}
