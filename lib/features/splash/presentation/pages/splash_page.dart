import 'package:amazon_clone_app/config/navigation/routes.dart';

import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentation/bloc/auth/auth_events.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AuthLocalDataSourceImplWithHive authLocalDataSourceWithHive =
          AuthLocalDataSourceImplWithHive.init();

      User? userData = authLocalDataSourceWithHive.getValue(
        key: AppConstantText.hiveKeyForCachedUserData,
      );
      final String? userToken = userData?.token;

      Future.delayed(const Duration(milliseconds: 1000)).then((_) {
        if (userToken != null) {
          BlocProvider.of<AuthBloc>(context)
              .add(GetUserDataEvent(userToken: userToken));
          context.replaceScreen(Routes.bottomBar);
        }else {
          context.replaceScreen(Routes.authPage);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.screenWidth(context: context);
    return Scaffold(
      body: Center(
        child: Image.asset(ImageAssets.appBarLogo, width: 0.35 * screenWidth),
      ),
    );
  }
}
