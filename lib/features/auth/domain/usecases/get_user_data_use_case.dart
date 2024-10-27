import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/domain/domain_import_packages.dart';

import 'package:dartz/dartz.dart';

class GetUserDataUseCase {
  final AuthRepository _repository;

  const GetUserDataUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call({required String userToken})async => await _repository.getUserData(userToken: userToken);
}
