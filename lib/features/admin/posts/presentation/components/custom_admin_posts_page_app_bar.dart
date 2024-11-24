import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:flutter/material.dart';

class CustomAdminPostsPageAppBar extends StatelessWidget {
  final Orientation orientation;
  const CustomAdminPostsPageAppBar({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final type = Helper.getCachedData()!.type;
    final screenWidth = Helper.screenWidth(context: context);
    final screenHeight = Helper.screenHeight(context: context);
    final orientationCondition = orientation == Orientation.portrait;

    return CustomAppBar(
      orientation: orientation,
      appBarActions: [
        Padding(
          padding: EdgeInsets.only(right: 0.05 * screenWidth),
          child: CustomBoldTxt(
            text: type!,
            fontSize:orientationCondition? 0.07 * screenWidth:0.05*screenWidth,
          ),
        )
      ],
      appBarLeading: Padding(
        padding: EdgeInsets.only(top: 0.02 * screenHeight),
        child: Image.asset(
          ImageAssets.accountPageAppBarLogo,
        ),
      ),
    );
  }
}
