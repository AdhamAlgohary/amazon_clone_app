import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/core/widgets/bottom_bar_item_custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAdminBottomBar extends StatelessWidget {
  const CustomAdminBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (_, state) => CustomBottomBar(
        state: state,
        pages: state.adminPages,
        bottomBarOnTapFunc: (pageIndex) =>
            bottomAppBarOnTapFunc(context: context, pageIndex: pageIndex),
        bottomBarSecondDisableIcon: const Icon(Icons.analytics_outlined),
        bottomBarSecondActiveIcon:
            const BottomBarItemCustomContainer(child: Icon(Icons.analytics)),
        bottomBarThirdDisableIcon: const Icon(Icons.all_inbox_outlined),
        bottomBarThirdActiveIcon:
            const BottomBarItemCustomContainer(child: Icon(Icons.all_inbox)),
      ),
    );
  }
}

void bottomAppBarOnTapFunc(
        {required BuildContext context, required int pageIndex}) =>
    context.read<BottomBarCubit>().bottomBarOnTapFunc(pageIndex: pageIndex);
