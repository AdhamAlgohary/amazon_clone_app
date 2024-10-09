import 'package:amazon_clone_app/core/constants/app_constant_text.dart';
import 'package:amazon_clone_app/core/utils/extensions.dart';
import 'package:amazon_clone_app/core/utils/helpers/screen_size.dart';
import 'package:amazon_clone_app/core/utils/ui/snackbar_message.dart';
import 'package:amazon_clone_app/core/widgets/loading_widget.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/auth_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/sign_in_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/sign_up_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/components/sign_in_form_component.dart';
import 'package:amazon_clone_app/features/auth/presentaion/components/sign_up_form_component.dart';
import '../../../../config/navigation/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPageContent extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> signUpFormKey;
  final GlobalKey<FormState> signInFormKey;

  const AuthPageContent({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.signUpFormKey,
    required this.signInFormKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
        listener: (context, state) => _handleStateChanges(context, state),
        builder: (context, state) => _buildContent(context, state));
  }

  Widget _buildContent(BuildContext context, AuthStates state) {
    final screenHeight = ScreenSize.screenHeight(context: context);

    if (state is LoadingState) {
      return const LoadingWidget();
    }

    return BlocBuilder<HoldChangableDataBloc, HoldChangableDataStates>(
        builder: (_, state) => OrientationBuilder(
              builder: (_, orientation) => ListView(
                padding: EdgeInsets.only(top: 0.1 * screenHeight),
                children: [
                  SignUpFormComponent(
                    orientation: orientation,
                    selectedSignUpOrSignInForm:
                        AppConstantText.authPageCreateAccountTxt,
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: signUpFormKey,
                    state: state,
                  ),

                  SignInFormComponent(
                    orientation: orientation,
                    selectedSignUpOrSignInForm:
                        AppConstantText.authPageSignInBtnTxt,
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: signInFormKey,
                    state: state,
                  ),
                ],
              ),
            ));
  }

  void _handleStateChanges(BuildContext context, AuthStates state) {
    switch (state) {
      case MessageCreateUserState _:
        {
          _clearControllers();
          SnackbarMsg.showSnackBar(
            context: context,
            msg: state.msgFromApi,
            isSuccessSnacBar: true,
          );
          break;
        }
      case SuccessfulLoginState _:
        context.replaceScreen(Routes.homePage);

      case FailedState _:
        SnackbarMsg.showSnackBar(
            context: context, msg: state.failedMsg, isSuccessSnacBar: false);
        break;

      default:
        const Text("No State");
    }
  }

  void _clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
