import 'package:amazon_clone_app/config/theme/app_theme_mode/app_dark_theme.dart';
import 'package:amazon_clone_app/config/theme/app_theme_mode/app_light_theme.dart';
import 'package:amazon_clone_app/config/navigation/app_route.dart';
import 'package:amazon_clone_app/config/navigation/routes.dart';
import 'package:amazon_clone_app/core/constants/app_constant_text.dart';
import 'package:amazon_clone_app/features/auth/data/datasources/auth_local_data_sorce/auth_local_data_sorce_impl_with_shared_preferences.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_events.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmazonCloneApp extends StatefulWidget {
  const AmazonCloneApp({super.key});

  @override
  State<AmazonCloneApp> createState() => _AmazonCloneAppState();
}

class _AmazonCloneAppState extends State<AmazonCloneApp> {
  late final AuthLocalDataSourceWithSharedPreferences
      authLocalDataSourceWithSharedPreferences;

  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(const GetUserDataEvent());

    authLocalDataSourceWithSharedPreferences =
        AuthLocalDataSourceWithSharedPreferences.init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<AuthBloc>(context).userToken =
          await authLocalDataSourceWithSharedPreferences.getValue(
              key: AppConstantText.keyForCachedUserToken);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppLightTheme.lightTheme,
      darkTheme: AppDarkTheme.darkTheme,

      onGenerateRoute: (routeSettings) => AppRoute.generateRoute(routeSettings),
      initialRoute: Routes.splash,
      
    );
  }
}
