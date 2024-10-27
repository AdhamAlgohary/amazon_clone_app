import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/home/presentation/home_presentation_imported_packages.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenSize.screenHeight(context: context);

    return OrientationBuilder(
      builder: (_, orientation) => Scaffold(
        appBar: PreferredSize(
            preferredSize: orientation == Orientation.portrait
                ? Size.fromHeight(0.1 * screenHeight)
                : Size.fromHeight(0.25 * screenHeight),
            child: CustomHomePageAppBar(orientation: orientation)),
      ),
    );
  }
}
