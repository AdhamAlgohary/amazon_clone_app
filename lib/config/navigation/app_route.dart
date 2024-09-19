import 'package:amazon_clone_app/features/auth/presentaion/pages/auth_page.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone_app/config/navigation/routes.dart';

class AppRoute {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _getScreen(const Scaffold());
      case Routes.authPage:
        return _getScreen(const Scaffold(body: AuthPage()));

      default:
      throw const FormatException("Route not found");
    }
  }
static _getScreen(Widget child) => MaterialPageRoute(builder: (_)=>child);
}
