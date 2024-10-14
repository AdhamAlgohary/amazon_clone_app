import 'package:amazon_clone_app/config/theme/app_pallet_colors/light_pallet_colors.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(ImageAssets.appBarLogo),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search))
      ],
      flexibleSpace: Container(
        decoration:
            const BoxDecoration(gradient: LightPalletColor.appBarGradient),
      ),
    );
  }
}
