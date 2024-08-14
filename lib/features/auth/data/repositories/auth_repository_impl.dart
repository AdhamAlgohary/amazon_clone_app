import 'package:amazon_clone_app/core/error/exception.dart';
import 'package:amazon_clone_app/core/error/failure.dart';
import 'package:amazon_clone_app/core/network/network_info.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_local_data_sorce/auth_local_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/models/user.dart';
import 'package:amazon_clone_app/features/auth/domian/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domian/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  const AuthRepositoryImpl(
      {required this.networkInfo,
      required this.authRemoteDataSource,
      required this.authLocalDataSource});

  @override
  Future<Either<Failure, UserEntity>> signIn(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final userData =
            await authRemoteDataSource.signIn(email: email, password: password);
        authLocalDataSource.cacheUserData(userData);
        return Right(userData);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(OffLineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> signUpNewUser(
      {required UserEntity userEntity}) async {
    if (await networkInfo.isConnected) {
      try {
        final User userModel = User(userEntity.name, userEntity.email,
            userEntity.password);
        final user = await authRemoteDataSource.signUpNewUser(userModel);
        return Right(user);
      } on ClientException {
        return const Left(ClientFailure());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(OffLineFailure());
    }
  }
}
