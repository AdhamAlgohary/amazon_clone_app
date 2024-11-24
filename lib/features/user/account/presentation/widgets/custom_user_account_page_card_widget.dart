import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomUserAccountPageCardWidget extends StatelessWidget {
  final String imagePath;
  final Orientation orientation;
  const CustomUserAccountPageCardWidget(
      {super.key, required this.orientation, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Helper.screenWidth(context: context);
    return Card(
      margin: EdgeInsets.only(left: 0.03 * screenWidth),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.fill,
        width: orientation == Orientation.portrait
            ? 0.5 * screenWidth
            : 0.3 * screenWidth,
      ),
    );
  }
}
