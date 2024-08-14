import 'package:amazon_clone_app/core/theme/app_theme.dart';
import 'package:amazon_clone_app/core/strings/app_strings.dart';
import 'package:amazon_clone_app/features/auth/presentaion/pages/auth_page.dart';
import 'package:amazon_clone_app/routes.dart';
import 'package:amazon_clone_app/injection_container.dart' as ic;

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.titleOfApp,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightAppTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const SafeArea(
        child: AuthPage(),
      ),
    );
  }
}
