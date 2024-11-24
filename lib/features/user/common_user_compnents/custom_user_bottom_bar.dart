import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/core/widgets/bottom_bar_item_custom_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomUserBottomBar extends StatelessWidget {
  const CustomUserBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit,BottomBarState>(
      builder: (_, state) => CustomBottomBar(
        state: state,
        pages: state.userPages,
        bottomBarOnTapFunc: (pageIndex) =>
            bottomAppBarOnTapFunc(context: context, pageIndex: pageIndex),
        bottomBarSecondDisableIcon: const Icon(Icons.person_outlined),
        bottomBarSecondActiveIcon:
            const BottomBarItemCustomContainer(child: Icon(Icons.person)),
        bottomBarThirdDisableIcon: const Badge(
          child: Icon(Icons.shopping_cart_outlined),
        ),
        bottomBarThirdActiveIcon: const BottomBarItemCustomContainer(
            child: Icon(Icons.shopping_cart)),
      ),
    );
  }
}

void bottomAppBarOnTapFunc(
        {required BuildContext context, required int pageIndex}) =>
    context.read<BottomBarCubit>().bottomBarOnTapFunc(pageIndex: pageIndex);
