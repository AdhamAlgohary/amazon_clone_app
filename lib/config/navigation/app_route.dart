import 'package:amazon_clone_app/config/config_import_packages.dart';

import 'package:amazon_clone_app/features/admin/common_admin_componenets/custom_admin_bottom_bar.dart';
import 'package:amazon_clone_app/features/user/account/presentation/account_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';
import 'package:amazon_clone_app/features/user/cart/presentation/cart_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/user/home/presentation/home_presentation_imported_packages.dart';

import '../../features/splash/presentation/pages/splash_page.dart';

import 'package:flutter/material.dart';

import '../../features/user/common_user_compnents/custom_user_bottom_bar.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _getScreen(
          const SplashPage(),
        );
      case Routes.userPage:
        return _getScreen(
          const CustomUserBottomBar(),
        );
      case Routes.authPage:
        return _getScreen(const AuthPage());
      case Routes.homePage:
        return _getScreen(
          const HomePage(),
        );
      case Routes.accountPage:
        return _getScreen(
          const AccountPage(),
        );
      case Routes.cartPage:
        return _getScreen(
          const CartPage(),
        );
      case Routes.adminPage:
        return _getScreen(const CustomAdminBottomBar());
     

      default:
        throw const FormatException("Route not found");
    }
  }

  static _getScreen(Widget child) => MaterialPageRoute(builder: (_) => child);
}
