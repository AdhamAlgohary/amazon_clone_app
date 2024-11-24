import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/user/home/presentation/widgets/custom_home_page_single_category.dart';
import 'package:flutter/material.dart';

class CustomHomePageTopCategories extends StatelessWidget {
  final Orientation orientation;
  const CustomHomePageTopCategories({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Helper.screenHeight(context: context);
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:0.01*screenHeight),
      child: Row( 
        children: <Widget>[
          CustomHomePageSingleCategory(
              orientation: orientation,
              inkwellOnTapFunc: (){},
              categoryImg: ImageAssets.mobilesCategory,
              categoryTitle: AppConstantText.mobilesCategoryTxt),
      
          CustomHomePageSingleCategory(
              orientation: orientation,
              inkwellOnTapFunc: (){},
              categoryImg: ImageAssets.essentialsCategory,
              categoryTitle: AppConstantText.essentialsCategoryTxt),
              
          CustomHomePageSingleCategory(
              orientation: orientation,
              inkwellOnTapFunc: (){},
              categoryImg: ImageAssets.appliancesCategory,
              categoryTitle: AppConstantText.appliancesCategoryTxt),
              
          CustomHomePageSingleCategory(
              orientation: orientation,
              inkwellOnTapFunc: (){},
              categoryImg: ImageAssets.booksCategory,
              categoryTitle: AppConstantText.booksCategoryTxt),
              
          CustomHomePageSingleCategory(
             orientation: orientation,
              inkwellOnTapFunc: (){},
              categoryImg: ImageAssets.fashionCategory,
              categoryTitle: AppConstantText.fashionCategoryTxt),    
        ],
      ),
    );
  }
}
