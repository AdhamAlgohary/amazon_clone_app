import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';
import '../../domain/domain_import_packages.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignInFormComponent extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final HoldChangableDataStates state;
  final Orientation orientation;
  final String selectedSignUpOrSignInForm;

  const SignInFormComponent({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.state,
    required this.formKey,
    required this.orientation,
    required this.selectedSignUpOrSignInForm,
  });

  @override
  Widget build(BuildContext context) {
    return _columnOfWidgets(context: context);
  }

  Widget _columnOfWidgets({required BuildContext context}) {
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
          
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            CustomRadioTile(
                text: AppConstantText.authPageSignInBtnTxt,
                value: AppConstantText.authPageSignInBtnTxt,
                state: state),

            state.selectedSignInOrSignUp == AppConstantText.authPageSignInBtnTxt
                ? Column(
                    children: [
                      CustomTxtFormField(
                          textEditingController: emailController,
                          hintText: AppConstantText.authPageEmailHintTxt,
                          isObscure: false
                          ),

                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0.03 * screenHeight),
                        child: CustomTxtFormField(
                            textEditingController: passwordController,
                            hintText: AppConstantText.authPageShowPasswordTxt,
                            isObscure: state.selectedShowPasswordOrNot == false
                              ? true
                              : false
                            ),
                      ),

                      CustomCheckBoxTile(state: state),
                      
                      ElevatedButton(
                          onPressed: () =>
                              _performActionAfterValidateForm(context),
                          child:
                              const Text(AppConstantText.authPageSignInBtnTxt))
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  void _performActionAfterValidateForm(BuildContext context) {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      final user = UserEntity(
          email: emailController.text, password: passwordController.text);
      BlocProvider.of<AuthBloc>(context).add(SignInEvent(user: user));
    }
  }
}
