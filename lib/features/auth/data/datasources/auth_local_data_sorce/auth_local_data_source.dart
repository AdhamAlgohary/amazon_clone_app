import 'package:amazon_clone_app/features/auth/data/models/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthLocalDataSource {
  Future<Unit> cacheUserData(String keyForCachedData,User userData);
}
