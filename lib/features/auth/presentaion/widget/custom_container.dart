import 'package:amazon_clone_app/config/theme/app_pallet_colors/light_pallet_colors.dart';
import 'package:amazon_clone_app/core/utils/helpers/screen_size.dart';
import 'package:amazon_clone_app/features/auth/presentaion/bloc/hold_changable_data/hold_changable_data_states.dart';

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double selectedSignUpOrSignInFormHeight;
  final double notSelectedSignUpOrSignInFormHeight;
  final double horizontalMargin;
  final String selectedSignUpOrSignInForm;
  final HoldChangableDataStates state;
  
  const CustomContainer(
      {super.key,
      required this.child,
      required this.selectedSignUpOrSignInFormHeight,
      required this.state,
      required this.selectedSignUpOrSignInForm,
      required this.horizontalMargin,
      required this.notSelectedSignUpOrSignInFormHeight});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = ScreenSize.screenWidth(context: context);

    return Container(
        height: state.selectedSignInOrSignUp == selectedSignUpOrSignInForm
            ? selectedSignUpOrSignInFormHeight
            : notSelectedSignUpOrSignInFormHeight,
        padding: EdgeInsets.symmetric(horizontal: 0.07 * screenWidth),
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
        ),
        decoration: BoxDecoration(
          border: Border.all(
              width: 0.01 * screenWidth,
              color: LightPalletColor.lightDisableOrHintItem),
          color: state.selectedSignInOrSignUp == selectedSignUpOrSignInForm
              ? LightPalletColor.lightSurfaceVariant
              : LightPalletColor.lightDisableOrHintItem,
        ),
        child: child);
  }
}
