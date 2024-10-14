import 'package:amazon_clone_app/config/navigation/routes.dart';

import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth//data/data_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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

    Future.delayed(const Duration(milliseconds: 1000)).then((_) {
      context.replaceScreen(BlocProvider.of<AuthBloc>(context).userToken != null
          ? Routes.bottomBar
          : Routes.authPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
