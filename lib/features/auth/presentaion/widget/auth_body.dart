import 'package:amazon_clone_app/core/strings/app_strings.dart';
import 'package:amazon_clone_app/core/utils/screen_size.dart';
import 'package:amazon_clone_app/core/utils/snackbar_message.dart';
import 'package:amazon_clone_app/core/widgets/loading_widget.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/auth_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/sign_up_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/custom_container.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/sign_in_form_widget.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/sign_up_form_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBody extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> signUpFormKey;
  final GlobalKey<FormState> signInFormKey;
  const AuthBody({
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
      listener: (context, state) {
        _handleStateChanges(context, state);
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const LoadingWidget();
        } else {
          return BlocBuilder<HoldChangableDataBloc, HoldChangableDataStates>(
              builder: (context, state) => _buildFormContent(context, state));
        }
      },
    );
  }

  Widget _buildFormContent(
      BuildContext context, HoldChangableDataStates state) {
    final screenHeight = ScreenSize.screenHeight(context: context);
    return OrientationBuilder(
      builder: (_, orientation) => ListView(
        padding: EdgeInsets.only(top: 0.1 * screenHeight),
        children: [
          _handleOrientationChanges(
              orientation: orientation,
              selectedSignUpOrSignInForm: AppStrings.authPageCreateAccountTxt,
              context: context,
              state: state,
              child: SignUpFormWidget(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                formKey: signUpFormKey,
                state: state,
              )),
          _handleOrientationChanges(
            orientation: orientation,
            selectedSignUpOrSignInForm: AppStrings.authPageSignInBtnTxt,
            context: context,
            state: state,
            child: SignInFormWidget(
              emailController: emailController,
              passwordController: passwordController,
              formKey: signInFormKey,
              state: state,
            ),
          )
        ],
      ),
    );
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
      case ErrorCreateUserState _:
        {
          SnackbarMsg.showSnackBar(
            context: context,
            msg: state.failedMsg,
            isSuccessSnacBar: false,
          );
          break;
        }
      default:
        const Text("No State");
    }
  }

  Widget _handleOrientationChanges(
      {required Orientation orientation,
      required String selectedSignUpOrSignInForm,
      required BuildContext context,
      required HoldChangableDataStates state,
      required Widget child}) {
    final screenHeight = ScreenSize.screenHeight(context: context);
    final screenWidth = ScreenSize.screenWidth(context: context);
    return CustomContainer(
      selectedSignUpOrSignInForm: selectedSignUpOrSignInForm,
      state: state,
      horizontalMargin: orientation == Orientation.portrait
          ? 0.05 * screenWidth
          : 0.2 * screenWidth,
      selectedSignUpOrSignInFormHeight: orientation == Orientation.portrait
          ? 0.5 * screenHeight
          : 1 * screenHeight,
      notSelectedSignUpOrSignInFormHeight: orientation == Orientation.portrait
          ? 0.08 * screenHeight
          : 0.2 * screenHeight,
      child: child,
    );
  }

  void _clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
