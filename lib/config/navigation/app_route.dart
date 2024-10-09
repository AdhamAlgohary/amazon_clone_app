import 'package:amazon_clone_app/core/widgets/custom_bottom_bar.dart';
import 'package:amazon_clone_app/features/auth/presentaion/pages/auth_page.dart';
import 'package:amazon_clone_app/config/navigation/routes.dart';
import 'package:amazon_clone_app/features/splash/presentation/pages/splash_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _getScreen(const Scaffold(
          body: SplashPage(),
        ));
      case Routes.authPage:
        return _getScreen(const Scaffold(body: AuthPage()));
      case Routes.homePage:
        return _getScreen(const Scaffold(
          body: HomePage(),
          bottomNavigationBar: CustomBottomBar(),
        ));

      default:
        throw const FormatException("Route not found");
    }
  }

  static _getScreen(Widget child) => MaterialPageRoute(builder: (_) => child);
}
