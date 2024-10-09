import 'package:amazon_clone_app/core/app/amazon_clone_app.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone_app/injection_container.dart' as ic;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await ic.init();
  runApp(BlocProvider<AuthBloc>(
      create: (_) => ic.gi<AuthBloc>(), child: const AmazonCloneApp()));
}
