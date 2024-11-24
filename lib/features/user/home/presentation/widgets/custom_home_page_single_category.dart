import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:flutter/material.dart';

class CustomHomePageSingleCategory extends StatelessWidget {
  final void Function() inkwellOnTapFunc;
  final String categoryImg;
  final String categoryTitle;
  final Orientation orientation;
  const CustomHomePageSingleCategory({
    super.key,
    required this.orientation,
    required this.inkwellOnTapFunc,
    required this.categoryImg,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final orientationCondition = orientation == Orientation.portrait;
    final screenWidth = Helper.screenWidth(context: context);

    return Expanded(
      child: InkWell(
        onTap: inkwellOnTapFunc,
        child: Column(
          children: [
            Image.asset(
              categoryImg,
              width: orientationCondition
                  ? 0.13 * screenWidth
                  : 0.08 * screenWidth,
            ),
            Text(categoryTitle)
          ],
        ),
      ),
    );
  }
}
