import 'package:amazon_clone_app/features/account/presentation/pages/account_page.dart';
import 'package:amazon_clone_app/features/cart/presentation/pages/cart_page.dart';
import 'package:amazon_clone_app/features/home/presentation/pages/home_page.dart';
import 'package:equatable/equatable.dart';

abstract class BottomBarCubitState extends Equatable {
  final int pageIndex;
   final pages = [
    const HomePage(),
    const AccountPage(),
    const CartPage(),
  ];
   BottomBarCubitState({required this.pageIndex});
  @override
  List<Object?> get props => [pageIndex];
}

class IntialState extends BottomBarCubitState {
   IntialState({required super.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}

class ChangePageIndexState extends BottomBarCubitState {
   ChangePageIndexState({required super.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}
