import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/account/presentation/account_presentation_import_packages.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  final Orientation orientation;
  const Orders({super.key,required this.orientation});

  @override
  Widget build(BuildContext context) {
    final List temporaryList = [
      'https://images.unsplash.com/photo-1719937050792-a6a15d899281?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
      'https://plus.unsplash.com/premium_photo-1695635984394-79e2f6e79f92?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8',
      'https://images.unsplash.com/photo-1729631879440-a85f67f47083?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0fHx8ZW58MHx8fHx8',
      'https://plus.unsplash.com/premium_photo-1727895552599-fcd861505235?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2fHx8ZW58MHx8fHx8',
      'https://images.unsplash.com/photo-1729636364314-877a914f223a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8'
    ];

    final screenHeight = ScreenSize.screenHeight(context: context);
    final screenWidth = ScreenSize.screenWidth(context: context);
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
                text: AppConstantText.accountPageYourOrdersTxt,
                fontSize:orientation==Orientation.portrait? 0.065 * screenWidth:0.035*screenWidth,
              ),
              const CustomBoldTxt(
                text: AppConstantText.accountPageSeeAllTxt,
                textColor: LightPalletColor.lightGreen,
              ),
            ],
          ),
          SizedBox(
            width: screenWidth,
            height: 0.25 * screenHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: temporaryList.length,
              itemBuilder: (_, index) =>  CustomCard(
                orientation: orientation,
                imagePath: '${temporaryList[index]}',
              ),
            ),
          )
        ],
      ),
    );
  }
}
