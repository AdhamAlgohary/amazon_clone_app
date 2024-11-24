import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:flutter/material.dart';

class CustomAdminAddProductPageAppBar extends StatelessWidget {
  final Orientation orientation;
  const CustomAdminAddProductPageAppBar({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Helper.screenWidth(context: context);
    final orientationCondition = orientation == Orientation.portrait;

    return CustomAppBar(
      orientation: orientation,
      portraitLeadingWidth: 0.1 * screenWidth,
      landscapeLeadingWidth: 0.05 * screenWidth,
      appBarLeading: Padding(
        padding: EdgeInsets.only(
          left: 0.05 * screenWidth,
        ),
        child: IconButton(
            onPressed: () => context.popScreen(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      appBarTitle: CustomBoldTxt(
          fontSize:
              orientationCondition ? 0.06 * screenWidth : 0.05 * screenWidth,
          text: AppConstantText.adminAddProductPageAppBarTitleTxt),
    );
  }
}
