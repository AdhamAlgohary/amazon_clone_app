import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final Orientation orientation;
  const CustomCard(
      {super.key, required this.orientation, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.screenWidth(context: context);
    return Card(
      margin: EdgeInsets.only(left: 0.03 * screenWidth),
      child: Image.network(
        imagePath,
        fit: BoxFit.fill,
        width: orientation == Orientation.portrait
            ? 0.5 * screenWidth
            : 0.3 * screenWidth,
      ),
    );
  }
}
