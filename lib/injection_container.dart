import 'package:amazon_clone_app/core/cubit/bottom_bar_cubit/bottom_bar_cubit_bloc.dart';
import 'package:amazon_clone_app/features/auth/domian/usecases/get_user_data_use_case.dart';
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
import 'package:amazon_clone_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:amazon_clone_app/features/auth/domian/repositories/auth_repository.dart';
import 'package:amazon_clone_app/features/auth/domian/usecases/sign_in_use_case.dart';
import 'package:amazon_clone_app/features/auth/domian/usecases/sign_up_new_user_use_case.dart';

import 'features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source.dart';
import 'features/auth/data/datasources/auth_remote_data_source/auth_remote_data_source_impl_with_http.dart';

final gi = GetIt.instance;

Future<void> init() async {
  //core
  gi.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImplWithConnectionChecker(internetConnectionChecker: gi()));
  gi.registerLazySingleton(() => InternetConnectionChecker());
  gi.registerFactory(() => BottomBarCubitBloc());
  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  gi.registerLazySingleton(() => sharedPreferences);
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
  gi.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceWithSharedPreferences());
}
