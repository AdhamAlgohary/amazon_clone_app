import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';

import 'package:flutter/material.dart';

class CustomAccountPageAppBar extends StatelessWidget {
  final Orientation orientation;
  const CustomAccountPageAppBar({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.screenWidth(context: context);
    final screenHeight = ScreenSize.screenHeight(context: context);

    final authLocalDataSourceImplWithHive =
        AuthLocalDataSourceImplWithHive.init();
    final User userData = authLocalDataSourceImplWithHive.getValue(
      key: AppConstantText.hiveKeyForCachedUserData,
    )!;

    final type = userData.type;

    return AppBar(
      toolbarHeight: orientation == Orientation.portrait
          ? 0.2 * screenHeight
          : 0.25 * screenHeight,
      leadingWidth: orientation == Orientation.portrait
          ? 0.4 * screenWidth
          : 0.2 * screenWidth,
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search))
      ],
      flexibleSpace: Container(
        decoration:
            const BoxDecoration(gradient: LightPalletColor.appBarGradient),
      ),
      leading: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.008 * screenHeight,left: 0.01*screenWidth),
            child: Image.asset(
              ImageAssets.appBarLogo,
              width: orientation == Orientation.portrait
                  ? 0.35 * screenWidth
                  : 0.2 * screenWidth,
            ),
          ),
          RichText(
            text: TextSpan(
                text: '${AppConstantText.accountPageHelloTxt},',
                style: AppTextStyle.smallNormalLabelTxtStyle(
                    context: context,
                    color: LightPalletColor.lightOnPrimary,
                    fontSize: orientation == Orientation.portrait
                        ? 0.06 * ScreenSize.screenWidth(context: context)
                        : 0.03 * ScreenSize.screenWidth(context: context)),

                children: [
                  TextSpan(
                      text: ' $type',
                      style: AppTextStyle.mediumBoldLabelTxtStyle(
                          context: context,
                          color: LightPalletColor.lightOnPrimary,
                          fontSize: orientation == Orientation.portrait
                              ? 0.06 * ScreenSize.screenWidth(context: context)
                              : 0.03 *
                                  ScreenSize.screenWidth(context: context)))
                ]),
          )
        ],
      ),
    );
  }
}
