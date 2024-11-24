import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/auth/data/data_import_packages.dart';
import 'package:flutter/material.dart';

class CustomHomePageAddressBox extends StatelessWidget {
  final Orientation orientation;
  const CustomHomePageAddressBox({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Helper.screenWidth(context: context);
    final orientationCondition = orientation == Orientation.portrait;

    final authLocalDataSourceImplWithHive =
        AuthLocalDataSourceImplWithHive.init();
    final User userData = authLocalDataSourceImplWithHive.getValue(
      key: AppConstantText.hiveKeyForCachedUserData,
    )!;

    final userAddress = userData.address;
    final userName = userData.name;

    return Container(
      padding: EdgeInsets.all(0.02 * screenWidth),
      decoration: const BoxDecoration(
          gradient: LightPalletColor.homePageAddressBoxGradient),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Icon(
              Icons.location_on_outlined,
              size: orientationCondition
                  ? 0.06 * screenWidth
                  : 0.05 * screenWidth,
            ),
          ),
          Expanded(
            flex: 10,
            child: Text(
              '${AppConstantText.userHomePageDeliveryToTxt} $userName - $userAddress',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.smallBodyTxtStyle(context: context),
            ),
          ),
          Expanded(
              child: Icon(
            Icons.arrow_drop_down_outlined,
            size:
                orientationCondition ? 0.08 * screenWidth : 0.06 * screenWidth,
          ))
        ],
      ),
    );
  }
}
