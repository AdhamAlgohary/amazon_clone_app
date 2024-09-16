import 'package:amazon_clone_app/core/constants/app_constant_text.dart';
import 'package:amazon_clone_app/core/utils/helpers/screen_size.dart';
import 'package:amazon_clone_app/core/widgets/custom_txt_form_field.dart';
import 'package:amazon_clone_app/features/auth/domian/entities/user_entity.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_bloc.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_events.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_states.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/custom_check_box_tile.dart';
import 'package:amazon_clone_app/features/auth/presentaion/widget/custom_radio_tile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final HoldChangableDataStates state;
  const SignUpFormWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.state,
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
    final screenHeight = ScreenSize.screenHeight(context: context);
    return Form(
      key: formKey,
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
                            _validateFormThenCreateAccountBtnOnPressed(context),
                        child: const Text(AppConstantText.authPageCreateAccountTxt))
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  void _validateFormThenCreateAccountBtnOnPressed(BuildContext context) {
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
