import 'package:amazon_clone_app/core/theme/app_theme.dart';
import 'package:amazon_clone_app/core/strings/app_strings.dart';
import 'package:amazon_clone_app/features/auth/presentaion/pages/auth_page.dart';
import 'package:amazon_clone_app/features/auth/presentaion/provider/hold_changable_data_provider.dart';
import 'package:amazon_clone_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>HoldChangableDataProvider(),
      child: MaterialApp(
        title: AppStrings.titleOfApp,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        home:const SafeArea(child: AuthPage(),),
        
      ),
    );
  }
}

