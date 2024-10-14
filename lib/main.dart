import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';
import 'package:amazon_clone_app/injection_container.dart' as ic;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ic.init();
  runApp(MultiBlocProvider(
    providers: [BlocProvider<AuthBloc>(create: (_) => ic.gi<AuthBloc>()),
    BlocProvider<BottomBarCubitBloc>(create: (_) => ic.gi<BottomBarCubitBloc>()),
    ],
    child: const AmazonCloneApp(),
  ));
}
