import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/presentation/admin_add_product_page_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';
import 'package:amazon_clone_app/injection_container.dart' as ic;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dbDir.path);
  Hive.registerAdapter(UserAdapter());
  AuthLocalDataSourceImplWithHive.hiveBox =
      await Hive.openBox<User>(AppConstantText.hiveBoxName);

  await ic.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => ic.gi<AuthBloc>()),
        BlocProvider<BottomBarCubit>(create: (_) => ic.gi<BottomBarCubit>()),
        BlocProvider(
          create: (context) => DropDownMenuCubit(),
        ),
        BlocProvider(
          create: (context) => PickImagesCubit(),
        )
      ],
      child: const AmazonCloneApp(),
    );
  }
}
