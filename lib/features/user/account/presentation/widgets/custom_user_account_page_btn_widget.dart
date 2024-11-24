import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:flutter/material.dart';

class CustomUserAccountPageBtnWidget extends StatelessWidget {
  final void Function()? accountPageBtnOnPressed;
  final String accountPageBtnTxt;
  const CustomUserAccountPageBtnWidget(
      {super.key,
      this.accountPageBtnOnPressed,
      required this.accountPageBtnTxt});

  @override
  Widget build(BuildContext context) {
    final height = Helper.screenHeight(context: context);
    final width = Helper.screenWidth(context: context);
    return Padding(
      padding: EdgeInsets.only(left: 0.025 * width, top: 0.016 * height),
      child: ElevatedButton(
        onPressed: accountPageBtnOnPressed,
        style: ElevatedButton.styleFrom().copyWith(
          backgroundColor: const WidgetStatePropertyAll<Color>(
              LightPalletColor.lighterGreyy),
          minimumSize:
              WidgetStatePropertyAll<Size>(Size(0.45 * width, 0.065 * height)),

          shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
              side: const BorderSide(color: LightPalletColor.lightOnSurface),
              borderRadius: BorderRadius.circular(0.1 * width))),
        ),
        child: CustomBoldTxt(
          text: accountPageBtnTxt,
        ),
      ),
    );
  }
}
