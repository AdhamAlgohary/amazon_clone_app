import 'package:flutter/material.dart';

import 'package:amazon_clone_app/features/splash/presentation/pages/splash_page.dart';
import 'package:amazon_clone_app/injection_container.dart' as ic;

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  runApp(const SplashPage());
  
}


