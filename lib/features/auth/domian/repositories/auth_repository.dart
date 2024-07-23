import 'package:amazon_clone_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:amazon_clone_app/features/auth/domian/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUpNewUser(
      {required String name,required String email,required String password});
  Future<Either<Failure, UserEntity>> signIn({required String email,required String password});
}
