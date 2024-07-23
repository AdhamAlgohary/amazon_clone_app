import 'package:flutter/material.dart';

import 'features/auth/presentaion/pages/auth_page.dart';

class RouteGenerator {
  static const authPage = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authPage:
        return MaterialPageRoute(builder: (_) => const AuthPage());

      default:
      throw const FormatException("Route not found");
    }
  }
}
