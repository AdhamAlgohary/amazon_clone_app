import 'package:amazon_clone_app/core/error/failure.dart';
import 'package:amazon_clone_app/features/auth/domian/entities/user_entity.dart';
import 'package:amazon_clone_app/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserDataUseCase {
  final AuthRepository _repository;

  const GetUserDataUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call()async => await _repository.getUserData();
}
