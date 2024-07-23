import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import 'package:amazon_clone_app/core/strings/app_strings.dart';
import 'package:amazon_clone_app/core/utils/screen_size.dart';
import 'package:amazon_clone_app/core/widgets/custom_Txt_field.dart';
import 'package:amazon_clone_app/features/auth/presentaion/provider/hold_changable_data_provider.dart';

class SignUpFormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Orientation orientation;
  const SignUpFormWidget(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.orientation});

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenSize.screenHeight(context: context);

    switch (orientation) {
      case Orientation.portrait:
        return _columnOfWidgets(
            context: context, sizedBoxHeight: 0.4 * screenHeight);
      default:
        return _columnOfWidgets(
            context: context, sizedBoxHeight: 0.67 * screenHeight);
    }
  }

  Widget _columnOfWidgets({
    required BuildContext context,
    required double sizedBoxHeight,
  }) {
    var selectedSignInOrSignUpValue =
        context.watch<HoldChangableDataProvider>().selectedSignInOrSignUp;
    final screenHeight = ScreenSize.screenHeight(context: context);
    return Column(
      children: [
        RadioListTile(
          title: const Text(AppStrings.createAccountTxt),
          value: AppStrings.createAccountTxt,
          groupValue: selectedSignInOrSignUpValue,
          fillColor: selectedSignInOrSignUpValue == AppStrings.createAccountTxt
              ? const MaterialStatePropertyAll<Color>(AppColors.primaryColor)
              : const MaterialStatePropertyAll<Color>(
                  AppColors.hintOrDisableColor),
          onChanged: (val) => context
              .read<HoldChangableDataProvider>()
              .selectSignUpOrSignInRadioButton(val!),
        ),
        SizedBox(
            height: selectedSignInOrSignUpValue == AppStrings.createAccountTxt
                ? sizedBoxHeight
                : 0.01 * screenHeight,
            child: selectedSignInOrSignUpValue == AppStrings.createAccountTxt
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTxtField(
                          textEditingController: nameController,
                          isObscure: false,
                          hintText: AppStrings.nameHintTxt),
                      CustomTxtField(
                          textEditingController: emailController,
                          isObscure: false,
                          hintText: AppStrings.emailHintTxt),
                      CustomTxtField(
                          textEditingController: passwordController,
                          isObscure: true,
                          hintText: AppStrings.passwordHintTxt),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(AppStrings.createAccountTxt))
                    ],
                  )
                : const Divider(
                    color: AppColors.hidingColor,
                  ))
      ],
    );
  }
}
