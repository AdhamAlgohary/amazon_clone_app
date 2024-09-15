import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:amazon_clone_app/core/network/network_info.dart';
import 'package:amazon_clone_app/core/network/network_info_impl_with_connection_checker.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_local_data_sorce/auth_local_data_sorce_impl_with_shared_preferences.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_local_data_sorce/auth_local_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:amazon_clone_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:amazon_clone_app/features/auth/domian/repositories/auth_repository.dart';
import 'package:amazon_clone_app/features/auth/domian/usecases/sign_in_use_case.dart';
import 'package:amazon_clone_app/features/auth/domian/usecases/sign_up_new_user_use_case.dart';
import 'features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source_impl_with_http.dart';

final gi = GetIt.instance;

Future<void> init() async {
  // features : auth
  //Bloc
  gi.registerFactory(() => AuthBloc(signUpNewUserUseCase: gi()));
  gi.registerFactory(() => HoldChangableDataBloc());
  //usecases
  gi.registerLazySingleton(() => SignUpNewUserUseCase(gi()));
  gi.registerLazySingleton(() => SignInUseCase(gi()));
  //repositories
  gi.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      networkInfo: gi(),
      authRemoteDataSource: gi(),
      authLocalDataSource: gi()));
  //datasorces
  gi.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImplWithHttp(client: gi()));
  gi.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImplWithSharedPreferences(sharedPreferences: gi()));

  gi.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImplWithConnectionChecker(internetConnectionChecker: gi()));
  gi.registerLazySingleton(() => InternetConnectionChecker());
  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  gi.registerLazySingleton(() => sharedPreferences);
  gi.registerLazySingleton(() => http.Client());
  // gi.registerLazySingleton(() => InternetConnectionChecker());
}
