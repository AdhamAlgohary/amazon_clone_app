import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';
import 'package:amazon_clone_app/injection_container.dart' as ic;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> signUpFormKey;
  late final GlobalKey<FormState> signInFormKey;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    signUpFormKey = GlobalKey<FormState>();
    signInFormKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HoldChangableDataBloc>(
      create: (_) => ic.gi<HoldChangableDataBloc>(),

      child: AuthPageContent(
        nameController: nameController,
        emailController: emailController,
        passwordController: passwordController,
        signUpFormKey: signUpFormKey,
        signInFormKey: signInFormKey,
      ),
    );
  }
}
