import 'package:flutter/material.dart';

import 'package:amazon_clone_app/config/navigation/routes.dart';
import 'package:amazon_clone_app/features/auth/presentaion/pages/auth_page.dart';

class AppRoute {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _getScreen(const Scaffold());
      case Routes.authPage:
        return _getScreen(const Scaffold());

      default:
      throw const FormatException("Route not found");
    }
  }
static _getScreen(Widget child) => MaterialPageRoute(builder: (_)=>child);
}
