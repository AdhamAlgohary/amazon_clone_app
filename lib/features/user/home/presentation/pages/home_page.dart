import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/user/home/presentation/home_presentation_imported_packages.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Helper.screenHeight(context: context);
    final screenWidth = Helper.screenWidth(context: context);

    return OrientationBuilder(
      builder: (_, orientation) => Scaffold(
        appBar: PreferredSize(
            preferredSize: orientation == Orientation.portrait
                ? Size.fromHeight(0.1 * screenHeight)
                : Size.fromHeight(0.2 * screenHeight),
            child: CustomHomePageAppBar(orientation: orientation)),
        body: ListView(
          children: <Widget>[
            CustomHomePageAddressBox(
              orientation: orientation,
            ),
            CustomHomePageTopCategories(
              orientation: orientation,
            ),
            CustomCarouselImage(
              orientation: orientation,
              carouselImgs: GlobalVariables.homePageCarouselImgs
                  .map((i) => CachedNetworkImage(
                        imageUrl: i,
                        width: screenWidth,
                        fit: BoxFit.fill,
                      ))
                  .toList(),
            ),
            CustomHomePageDealOfDay(
              orientation: orientation,
            )
          ],
        ),
      ),
    );
  }
}
