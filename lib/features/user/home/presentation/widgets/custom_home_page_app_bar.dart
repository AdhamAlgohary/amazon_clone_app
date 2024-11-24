import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';

import 'package:flutter/material.dart';

class CustomHomePageAppBar extends StatelessWidget {
  final Orientation orientation;
  const CustomHomePageAppBar({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Helper.screenWidth(context: context);
    final screenHeight = Helper.screenHeight(context: context);
    final orientationCondition = orientation == Orientation.portrait;

    return AppBar(
        toolbarHeight:
            orientationCondition ? 0.2 * screenHeight : 0.25 * screenHeight,
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: LightPalletColor.appBarGradient),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 0.05 * screenWidth),
          child: SearchBar(
            leading: Icon(
              Icons.search,
              size: orientationCondition
                  ? 0.06 * screenWidth
                  : 0.04 * screenWidth,
            ),
            hintText: AppConstantText.userHomePageSearchAmazonTxt,
            hintStyle: WidgetStatePropertyAll<TextStyle?>(
                AppTextStyle.hintTxtStyle(context: context)),
            constraints: BoxConstraints(
                minHeight: 0.05 * screenHeight,
                maxWidth: orientationCondition
                    ? 0.9 * screenWidth
                    : 0.8 * screenWidth),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic),
            iconSize:
                orientationCondition ? 0.07 * screenWidth : 0.05 * screenWidth,
            padding: EdgeInsets.only(
                right: orientationCondition
                    ? 0.06 * screenWidth
                    : 0.1 * screenWidth),
          ),
        ],
        
     );
  }
}
