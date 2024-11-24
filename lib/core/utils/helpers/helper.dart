import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class Helper {
  static User? getCachedData() {
    final authLocalDataSourceImplWithHive =
        AuthLocalDataSourceImplWithHive.init();
    final User userData = authLocalDataSourceImplWithHive.getValue(
      key: AppConstantText.hiveKeyForCachedUserData,
    )!;

    return userData;
  }

  static Future<Either<Failure, T>> performActionWithNetworkCheck<T>(
      {required NetworkInfo networkInfo,
      required Future<T> Function() action}) async {
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

  static double screenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }
}
