import 'package:amazon_clone_app/core/cubit/bottom_bar_cubit/bottom_bar_cubit_bloc.dart';
import 'package:amazon_clone_app/core/cubit/bottom_bar_cubit/bottom_bar_cubit_state.dart';
import 'package:amazon_clone_app/features/account/presentation/pages/account_page.dart';
import 'package:amazon_clone_app/features/cart/presentation/pages/cart_page.dart';
import 'package:amazon_clone_app/features/home/presentation/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const AccountPage(),
      const CartPage(),
    ];

    return BlocBuilder<BottomBarCubitBloc, BottomBarCubitState>(
      builder: (_, state) => Scaffold(
        body: pages[state.pageIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.pageIndex,
          onTap: (pageIndex) =>
              bottomAppBarOnTapFunc(context: context, pageIndex: pageIndex),

          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
            ),

            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person),
            ),
            
            BottomNavigationBarItem(
              label: '',
              icon: Badge(
                child: Icon(Icons.shopping_cart_outlined),
              ),
              activeIcon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}

void bottomAppBarOnTapFunc(
        {required BuildContext context, required int pageIndex}) =>
    context.read<BottomBarCubitBloc>().bottomBarOnTapFunc(pageIndex: pageIndex);
