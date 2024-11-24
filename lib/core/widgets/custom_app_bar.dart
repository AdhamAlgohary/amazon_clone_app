import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Orientation orientation;
  final List<Widget>? appBarActions;
  final Widget? appBarLeading;
  final Widget? appBarTitle;
  final double? portraitLeadingWidth;
  final double? landscapeLeadingWidth;
  const CustomAppBar(
      {super.key,
      required this.orientation,
      this.appBarActions,
      this.appBarLeading,
      this.appBarTitle,
      this.portraitLeadingWidth,
      this.landscapeLeadingWidth});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Helper.screenWidth(context: context);
    final screenHeight = Helper.screenHeight(context: context);
    final orientationCondition = orientation == Orientation.portrait;

    return AppBar(
        title: appBarTitle,
        centerTitle: true,
        toolbarHeight:
            orientationCondition ? 0.3 * screenHeight : 0.25 * screenHeight,
        leadingWidth: orientationCondition
            ? portraitLeadingWidth ?? 0.4 * screenWidth
            : landscapeLeadingWidth ?? 0.2 * screenWidth,
        actions: appBarActions,
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: LightPalletColor.appBarGradient),
        ),
        leading: appBarLeading);
  }
}
