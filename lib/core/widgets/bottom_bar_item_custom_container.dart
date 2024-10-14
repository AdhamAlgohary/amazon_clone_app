import 'package:amazon_clone_app/core/core_import_packages.dart';

import '../../config/theme/app_pallet_colors/light_pallet_colors.dart';

import 'package:flutter/material.dart';

class BottomBarItemCustomContainer extends StatelessWidget {
  final Widget child;
  const BottomBarItemCustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.screenWidth(context: context);

    return Container(
      decoration:  BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 0.01 * screenWidth,
                  color: LightPalletColor.lightOutline))),
      width: 0.1 * screenWidth,
      child: child,
    );
  }
}
