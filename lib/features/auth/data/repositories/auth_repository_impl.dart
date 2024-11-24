import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';
import 'package:amazon_clone_app/features/auth/domain/domain_import_packages.dart';

import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl(
      {required this.networkInfo,
      required this.authRemoteDataSource,
      required this.authLocalDataSource});

  @override
  Future<Either<Failure, Unit>> signIn(
          {required UserEntity userEntity}) async =>
      Helper.performActionWithNetworkCheck<Unit>(
          networkInfo: networkInfo,
          action: () async {
            authLocalDataSource = AuthLocalDataSourceImplWithHive.init();
            final User userModel = _mapUserEntityToUserModel(userEntity);
            final userData = await authRemoteDataSource.signIn(userModel);
            cacheUserData(userData: userData);

            return unit;
          });

  @override
  Future<Either<Failure, String>> signUpNewUser(
          {required UserEntity userEntity}) async =>
      Helper.performActionWithNetworkCheck<String>(
          networkInfo: networkInfo,
          action: () async {
            final User userModel = _mapUserEntityToUserModel(userEntity);
            final msgFromApi =
                await authRemoteDataSource.signUpNewUser(userModel);

            return msgFromApi;
          });

  @override
  Future<Either<Failure, UserEntity>> getUserData(
          {required String userToken}) async =>
      Helper.performActionWithNetworkCheck<User>(
          networkInfo: networkInfo,
          action: () async {
            final userData =
                await authRemoteDataSource.getUserData(userToken: userToken);

            return userData;
          });

  User _mapUserEntityToUserModel(UserEntity userEntity) => User(
      name: userEntity.name,
      email: userEntity.email,
      password: userEntity.password);

  void cacheUserData({required User userData}) async =>
      await authLocalDataSource.setValue<User>(
        key: AppConstantText.hiveKeyForCachedUserData,
        value: userData,
      );
}
