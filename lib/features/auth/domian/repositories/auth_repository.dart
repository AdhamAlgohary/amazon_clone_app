import 'package:amazon_clone_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:amazon_clone_app/features/auth/domian/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signUpNewUser(
      {required UserEntity userEntity});
<<<<<<< HEAD

=======
>>>>>>> refactor-code-and-architcture-branch
  Future<Either<Failure, Unit>> signIn({required UserEntity userEntity});
  Future<Either<Failure, UserEntity>> getUserData();
}
