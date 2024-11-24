import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomHomePageDealOfDay extends StatelessWidget {
  final Orientation orientation;
  const CustomHomePageDealOfDay({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final orientationCondition = orientation == Orientation.portrait;
    final screenHeight = Helper.screenHeight(context: context);
    final screenWidth = Helper.screenWidth(context: context);

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 0.01 * screenHeight, horizontal: 0.02 * screenWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppConstantText.userHomePageDealOfDayTxt,
            style: AppTextStyle.smallBodyTxtStyle(
                context: context, fontWeight: FontWeight.normal),
          ),
          CachedNetworkImage(
            imageUrl: GlobalVariables.accountPageOrdersImgs[0],
            width: screenWidth,
            fit: BoxFit.fitWidth,
            height:
                orientationCondition ? 0.4 * screenHeight : 0.7 * screenHeight,
          ),
          Text(
            AppConstantText.userHomePageDealOfDayPriceTxt,
            style: AppTextStyle.smallBodyTxtStyle(
                context: context, fontWeight: FontWeight.bold),
          ),
          Text(
            AppConstantText.userHomePageDealOfDayNameTxt,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.smallBodyTxtStyle(
                context: context,
                fontSize: orientationCondition
                    ? 0.045 * screenWidth
                    : 0.04 * screenWidth),
          ),
          SizedBox(
              height: orientationCondition
                  ? 0.15 * screenHeight
                  : 0.4 * screenHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: GlobalVariables.accountPageOrdersImgs.length,
                itemBuilder: (_, index) => CachedNetworkImage(
                    imageUrl: GlobalVariables.accountPageOrdersImgs[index],
                    fit: BoxFit.contain,
                    height: 0.1 * screenHeight,
                    width: orientationCondition
                        ? 0.5 * screenWidth
                        : 0.3 * screenWidth),
              ))
        ],
      ),
    );
  }
}
