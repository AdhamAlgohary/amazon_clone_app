import 'package:amazon_clone_app/core/app/amazon_clone_app.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone_app/injection_container.dart' as ic;

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  runApp( const AmazonCloneApp());
  
}


