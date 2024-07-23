import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:amazon_clone_app/core/utils/screen_size.dart';
import 'package:amazon_clone_app/features/auth/presentaion/provider/hold_changable_data_provider.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/sign_in_form_widget.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/sign_up_form_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
    return Scaffold(
        body: _buildBody(
            context, nameController, emailController, passwordController));
  }

  Widget _buildBody(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController passwordController) {
    final screenHeight = ScreenSize.screenHeight(context: context);
    final screenWidth = ScreenSize.screenWidth(context: context);
    return ChangeNotifierProvider(
        create: (context) => HoldChangableDataProvider(),
        child: OrientationBuilder(
          builder: (_, orientation) => ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: orientation == Orientation.portrait
                      ? 0.03 * screenWidth
                      : 0.2 * screenWidth,
                  vertical: 0.02 * screenHeight),
              children: [
                SignUpFormWidget(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  orientation: orientation,
                ),
                SignInFormWidget(
                  emailController: emailController,
                  passwordController: passwordController,
                  orientation: orientation,
                )
              ]),
        ));
  }
}
