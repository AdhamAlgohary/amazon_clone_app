import 'dart:developer';

import 'package:amazon_clone_app/config/navigation/routes.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentation/bloc/auth/auth_events.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userToken = Helper.getCachedData()?.token;
    final String? userType = Helper.getCachedData()?.type;
    final screenWidth = Helper.screenWidth(context: context);
    log(userToken.toString());

    _navigateFromSplashScreen(
        context: context, userToken: userToken, userType: userType);
    return Scaffold(
      body: Center(
        child: Image.asset(ImageAssets.accountPageAppBarLogo,
            width: 0.35 * screenWidth),
      ),
    );
  }
}

void _navigateFromSplashScreen(
    {required BuildContext context,
    required String? userToken,
    required String? userType}) {
  Future.delayed(const Duration(milliseconds: 1000)).then((_) {
    if (userToken != null) {
      if (userType == 'user') {
        BlocProvider.of<AuthBloc>(context)
            .add(GetUserDataEvent(userToken: userToken));
        context.replaceScreen(Routes.userPage);
      } else {
        context.replaceScreen(Routes.adminPage);
      }
    } else {
      context.replaceScreen(Routes.authPage);
    }
  });
}
