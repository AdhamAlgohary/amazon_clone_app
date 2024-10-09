import 'package:amazon_clone_app/config/navigation/routes.dart';
import 'package:amazon_clone_app/core/utils/extensions.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(milliseconds: 1000)).then((_) { context
        .replaceScreen(BlocProvider.of<AuthBloc>(context).userToken != null
            ? Routes.bottomBar
            : Routes.authPage);
          }
            );

    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
