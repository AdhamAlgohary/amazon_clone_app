import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:dartz/dartz.dart';
import 'package:amazon_clone_app/features/auth/domain/domain_import_packages.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signUpNewUser(
      {required UserEntity userEntity});
  Future<Either<Failure, Unit>> signIn({required UserEntity userEntity});
  Future<Either<Failure, UserEntity>> getUserData({required String userToken});
}
