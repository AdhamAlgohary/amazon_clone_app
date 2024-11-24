import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/domain/domain_import_packages.dart';
import 'package:amazon_clone_app/features/auth/presentation/presentation_import_packages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormComponent extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final HoldChangableDataStates state;
  final Orientation orientation;
  final String selectedSignUpOrSignInForm;

  const SignUpFormComponent({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.state,
     required this.orientation,
    required this.selectedSignUpOrSignInForm,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBody(
      context: context,
    );
  }

  Widget _buildBody({
    required BuildContext context,
  }) {
    final screenHeight = Helper.screenHeight(context: context);
    final screenWidth =Helper.screenWidth(context: context);

    return CustomContainer(
      selectedSignUpOrSignInForm: selectedSignUpOrSignInForm,
      state: state,
      horizontalMargin: orientation == Orientation.portrait
          ? 0.05 * screenWidth
          : 0.2 * screenWidth,
      selectedSignUpOrSignInFormHeight: orientation == Orientation.portrait
          ? 0.6 * screenHeight
          : 1 * screenHeight,
      notSelectedSignUpOrSignInFormHeight: orientation == Orientation.portrait
          ? 0.08 * screenHeight
          : 0.2 * screenHeight,
          
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              CustomRadioTile(
                text: AppConstantText.authPageCreateAccountTxt,
                value: AppConstantText.authPageCreateAccountTxt,
                state: state,
              ),
        
              state.selectedSignInOrSignUp == AppConstantText.authPageCreateAccountTxt
                  ? Column(
                      children: [
                        CustomTxtFormField(
                            textEditingController: nameController,
                            isObscure: false,
                            hintText: AppConstantText.authPageNameHintTxt),
        
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0.01 * screenHeight),
                          child: CustomTxtFormField(
                              textEditingController: emailController,
                              isObscure: false,
                              hintText: AppConstantText.authPageEmailHintTxt),
                        ),
        
                        CustomTxtFormField(
                            textEditingController: passwordController,
                            isObscure: state.selectedShowPasswordOrNot == false
                                ? true
                                : false,
                            hintText: AppConstantText.authPagePasswordHintTxt),
        
                        CustomCheckBoxTile(
                          state: state,
                        ),
        
                        ElevatedButton(
                            onPressed: () =>
                                _performActionAfterValidateForm(context),
                            child: const Text(AppConstantText.authPageCreateAccountTxt))
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  void _performActionAfterValidateForm(BuildContext context) {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      final user = UserEntity(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text);
      BlocProvider.of<AuthBloc>(context).add(SignUpEvent(user: user));
    }
  }

}
