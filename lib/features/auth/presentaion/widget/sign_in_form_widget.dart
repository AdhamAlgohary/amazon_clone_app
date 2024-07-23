import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:amazon_clone_app/core/theme/app_colors.dart';
import 'package:amazon_clone_app/core/strings/app_strings.dart';
import 'package:amazon_clone_app/core/utils/screen_size.dart';
import 'package:amazon_clone_app/features/auth/presentaion/provider/hold_changable_data_provider.dart';
import '../../../../core/widgets/custom_Txt_field.dart';


class SignInFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Orientation orientation;
  const SignInFormWidget(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.orientation});

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenSize.screenHeight(context: context);
    switch (orientation) {
      case Orientation.portrait:
        return _columnOfWidgets(
            context: context, sizedBoxHeight: 0.3 * screenHeight);
      default:
        return _columnOfWidgets(
          context: context,
          sizedBoxHeight: 0.6 * screenHeight,
        );
    }
  }
  Widget _columnOfWidgets(
      {required BuildContext context, required double sizedBoxHeight}) {
    var selectedSignInOrSignUpValue =
        context.watch<HoldChangableDataProvider>().selectedSignInOrSignUp;
    final screenHeight = ScreenSize.screenHeight(context: context);
    return Column(
      children: [
        RadioListTile(
            title: const Text(AppStrings.signInTxt),
            value: AppStrings.signInTxt,
            groupValue: selectedSignInOrSignUpValue,
            fillColor: selectedSignInOrSignUpValue == AppStrings.signInTxt
                ? const MaterialStatePropertyAll<Color>(AppColors.primaryColor)
                : const MaterialStatePropertyAll<Color>(
                    AppColors.hintOrDisableColor),
            onChanged: (val) => context
                .read<HoldChangableDataProvider>()
                .selectSignUpOrSignInRadioButton(val!)),
        SizedBox(
            height: selectedSignInOrSignUpValue == AppStrings.signInTxt
                ? sizedBoxHeight
                : 0.01 * screenHeight,
            child: selectedSignInOrSignUpValue == AppStrings.signInTxt
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                          child: const Text(AppStrings.signInTxt))
                    ],
                  )
                : const Divider(
                    color: AppColors.hidingColor,
                  ))
      ],
    );
  }
}
