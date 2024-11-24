import 'package:amazon_clone_app/core/core_import_packages.dart';

class GlobalVariables {
  static List accountPageOrdersImgs = [
    'https://images.unsplash.com/photo-1719937050792-a6a15d899281?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
    'https://plus.unsplash.com/premium_photo-1695635984394-79e2f6e79f92?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8',
    'https://images.unsplash.com/photo-1729631879440-a85f67f47083?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0fHx8ZW58MHx8fHx8',
    'https://plus.unsplash.com/premium_photo-1727895552599-fcd861505235?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2fHx8ZW58MHx8fHx8',
    'https://images.unsplash.com/photo-1729636364314-877a914f223a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8'
  ];
  static List<String> homePageCarouselImgs = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];
  static List<Map<String, String>> productCategory = [
    {
      'categoryTitle': AppConstantText.mobilesCategoryTxt,
      'categoryImg': ImageAssets.mobilesCategory
    },
    {
      'categoryTitle': AppConstantText.essentialsCategoryTxt,
      'categoryImg': ImageAssets.essentialsCategory
    },
    {
      'categoryTitle': AppConstantText.appliancesCategoryTxt,
      'categoryImg': ImageAssets.appliancesCategory
    },
    {
      'categoryTitle': AppConstantText.booksCategoryTxt,
      'categoryImg': ImageAssets.booksCategory
    },
    {
      'categoryTitle': AppConstantText.fashionCategoryTxt,
      'categoryImg': ImageAssets.fashionCategory
    },
  ];
}
