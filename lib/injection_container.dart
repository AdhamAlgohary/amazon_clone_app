import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/domain/domain_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';
import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;



final gi = GetIt.instance;

Future<void> init() async {
  //core
  gi.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImplWithConnectionChecker(internetConnectionChecker: gi()));
  gi.registerLazySingleton(() => InternetConnectionChecker());
  gi.registerFactory(() => BottomBarCubit());
  //external
  gi.registerLazySingleton(() => http.Client());

  // features : auth
  //Bloc
  gi.registerFactory(() => AuthBloc(
      signUpNewUserUseCase: gi(),
      signInUseCase: gi(),
      getUserDataUseCase: gi()));
  gi.registerFactory(() => HoldChangableDataBloc());
  //usecases
  gi.registerLazySingleton(() => SignUpNewUserUseCase(gi()));
  gi.registerLazySingleton(() => SignInUseCase(gi()));
  gi.registerLazySingleton(() => GetUserDataUseCase(gi()));
  //repositories
  gi.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      networkInfo: gi(),
      authRemoteDataSource: gi(),
      authLocalDataSource: gi()));
  //datasorces
  gi.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImplWithHttp(client: gi()));
//   gi.registerLazySingleton<AuthLocalDataSource>(
//       () => AuthLocalDataSourceImplWithSharedPreferences());
gi.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImplWithHive());    
}
