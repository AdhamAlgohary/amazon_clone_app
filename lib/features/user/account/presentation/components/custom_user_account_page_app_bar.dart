import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';

import 'package:flutter/material.dart';

class CustomUserAccountPageAppBar extends StatelessWidget {
  final Orientation orientation;
  const CustomUserAccountPageAppBar({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Helper.screenWidth(context: context);
    final screenHeight = Helper.screenHeight(context: context);
    final orientationCondition = orientation == Orientation.portrait;

    final type = Helper.getCachedData();

    return CustomAppBar(
      orientation: orientation,
      appBarActions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search))
      ],
      appBarLeading: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 0.008 * screenHeight, left: 0.01 * screenWidth),
              child: Image.asset(
                ImageAssets.accountPageAppBarLogo,
                width: orientationCondition
                    ? 0.35 * screenWidth
                    : 0.2 * screenWidth,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: '${AppConstantText.userAccountPageHelloTxt},',
                  style: AppTextStyle.smallNormalLabelTxtStyle(
                      context: context,
                      color: LightPalletColor.lightOnPrimary,
                      fontSize: orientationCondition
                          ? 0.06 * Helper.screenWidth(context: context)
                          : 0.03 * Helper.screenWidth(context: context)),
                  children: [
                    TextSpan(
                        text: ' $type',
                        style: AppTextStyle.mediumBoldLabelTxtStyle(
                            context: context,
                            color: LightPalletColor.lightOnPrimary,
                            fontSize: orientationCondition
                                ? 0.06 *
                                    Helper.screenWidth(context: context)
                                : 0.03 *
                                    Helper.screenWidth(context: context)))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
