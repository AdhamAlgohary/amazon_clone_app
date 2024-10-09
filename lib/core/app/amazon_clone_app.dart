import 'package:amazon_clone_app/config/theme/app_theme_mode/app_dark_theme.dart';
import 'package:amazon_clone_app/config/theme/app_theme_mode/app_light_theme.dart';
import 'package:amazon_clone_app/config/navigation/app_route.dart';
import 'package:amazon_clone_app/config/navigation/routes.dart';

import 'package:flutter/material.dart';

class AmazonCloneApp extends StatelessWidget {
  const AmazonCloneApp({super.key});

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
