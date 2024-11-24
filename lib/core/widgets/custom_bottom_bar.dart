import 'package:amazon_clone_app/config/theme/app_pallet_colors/light_pallet_colors.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/core/widgets/bottom_bar_item_custom_container.dart';

import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final BottomBarState state;
  final void Function(int) bottomBarOnTapFunc;
  final List<Widget> pages; 
  final Widget bottomBarSecondDisableIcon;
  final Widget bottomBarSecondActiveIcon;
  final Widget bottomBarThirdDisableIcon;
  final Widget bottomBarThirdActiveIcon;
  const CustomBottomBar({
    super.key,
    required this.state,
    required this.pages,
    required this.bottomBarOnTapFunc,
    required this.bottomBarSecondDisableIcon,
    required this.bottomBarSecondActiveIcon,
    required this.bottomBarThirdDisableIcon,
    required this.bottomBarThirdActiveIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightPalletColor.lightSurfaceVariant,
      body: pages[state.pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.pageIndex,
        onTap: bottomBarOnTapFunc,
        items: [
          const BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home_outlined),
            activeIcon: BottomBarItemCustomContainer(child: Icon(Icons.home)),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: bottomBarSecondDisableIcon,
            activeIcon: bottomBarSecondActiveIcon,
          ),
          BottomNavigationBarItem(
              label: '',
              icon: bottomBarThirdDisableIcon,
              activeIcon: bottomBarThirdActiveIcon),
        ],
      ),
    );
  }
}
