import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/user/account/presentation/account_presentation_import_packages.dart';
import 'package:flutter/material.dart';

class CustomUserAccountPageOrdersComponent extends StatelessWidget {
  final Orientation orientation;
  const CustomUserAccountPageOrdersComponent({super.key,required this.orientation});

  @override
  Widget build(BuildContext context) {

    final screenHeight = Helper.screenHeight(context: context);
    final screenWidth = Helper.screenWidth(context: context);
    return Padding(
      padding: EdgeInsets.only(
          right: 0.035 * screenWidth,
          left: 0.03 * screenWidth,
          top: 0.02 * screenHeight,
          ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBoldTxt(
                text: AppConstantText.userAccountPageYourOrdersTxt,
                fontSize:orientation==Orientation.portrait? 0.065 * screenWidth:0.035*screenWidth,
              ),
              const CustomBoldTxt(
                text: AppConstantText.userAccountPageSeeAllTxt,
                textColor: LightPalletColor.lightGreen,
              ),
            ],
          ),
          SizedBox(
            width: screenWidth,
            height: 0.25 * screenHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: GlobalVariables.accountPageOrdersImgs.length,
              itemBuilder: (_, index) =>  CustomUserAccountPageCardWidget(
                orientation: orientation,
                imagePath: '${GlobalVariables.accountPageOrdersImgs[index]}',
              ),
            ),
          )
        ],
      ),
    );
  }
}
