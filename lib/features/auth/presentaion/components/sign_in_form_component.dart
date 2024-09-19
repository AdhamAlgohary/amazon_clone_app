import 'package:amazon_clone_app/core/constants/app_constant_text.dart';
import 'package:amazon_clone_app/core/utils/helpers/screen_size.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/custom_check_box_tile.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/custom_container.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/custom_radio_tile.dart';
import '../../../../core/widgets/custom_txt_form_field.dart';

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
    final screenWidth =ScreenSize.screenWidth(context: context);

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
                          isObscure: false,
                          hintText: AppConstantText.authPageEmailHintTxt),

                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0.03 * screenHeight),
                        child: CustomTxtFormField(
                            textEditingController: passwordController,
                            isObscure: true,
                            hintText: AppConstantText.authPageShowPasswordTxt),
                      ),

                      CustomCheckBoxTile(state: state),
                      
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(AppConstantText.authPageSignInBtnTxt))
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
