import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';
import 'package:amazon_clone_app/features/auth/domain/domain_import_packages.dart';

import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  const AuthRepositoryImpl(
      {required this.networkInfo,
      required this.authRemoteDataSource,
      required this.authLocalDataSource});

  @override
  Future<Either<Failure, Unit>> signIn(
          {required UserEntity userEntity}) async =>
      _performActionWithNetworkCheck<Unit>(() async {
        final User userModel = _mapUserEntityToUserModel(userEntity);
        final userToken = await authRemoteDataSource.signIn(userModel);

        await authLocalDataSource.setValue<String>(
            key: AppConstantText.keyForCachedUserToken, value: userToken);
        
        return unit;
      });

  @override
  Future<Either<Failure, String>> signUpNewUser(
          {required UserEntity userEntity}) async =>
      _performActionWithNetworkCheck<String>(() async {
        final User userModel = _mapUserEntityToUserModel(userEntity);
        final msgFromApi = await authRemoteDataSource.signUpNewUser(userModel);

        return msgFromApi;
      });

  @override
  Future<Either<Failure, UserEntity>> getUserData() async =>
      _performActionWithNetworkCheck<User>(() async {
        final userData = await authRemoteDataSource.getUserData();

        return userData;
      });

  Future<Either<Failure, T>> _performActionWithNetworkCheck<T>(
      Future<T> Function() action) async {
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

  User _mapUserEntityToUserModel(UserEntity userEntity) => User(
      name: userEntity.name,
      email: userEntity.email,
      password: userEntity.password);
}
