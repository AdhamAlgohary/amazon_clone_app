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
  Future<Either<Failure, UserEntity>> signIn({required UserEntity userEntity}) {
    return _performActionWithNetworkCheck<UserEntity>(() async {
      final User userModel = _mapUserEntityToModel(userEntity);
      final userData = await authRemoteDataSource.signIn(userModel);
      // await authLocalDataSource.cacheUserData(userData);
      return userData;
    });
  }

  @override
  Future<Either<Failure, String>> signUpNewUser({
    required UserEntity userEntity,
  }) {
    return _performActionWithNetworkCheck<String>(
      () async {
        final User userModel = _mapUserEntityToModel(userEntity);
        final msgFromApi = await authRemoteDataSource.signUpNewUser(userModel);
        return msgFromApi;
      },
    );
  }

  Future<Either<Failure, T>> _performActionWithNetworkCheck<T>(
    Future<T> Function() action,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await action();
        return Right(result);
      } on ClientException {
        return const Left(ClientFailure());
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(OffLineFailure());
    }
  }

  User _mapUserEntityToModel(UserEntity userEntity) {
    return User(
      name: userEntity.name,
      email: userEntity.email,
      password: userEntity.password,
    );
  }

}
