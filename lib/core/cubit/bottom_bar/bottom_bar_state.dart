import 'package:equatable/equatable.dart';
import 'package:amazon_clone_app/features/admin/analytics/presentation/admin_analytics_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/admin/orders/presentation/admin_orders_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/admin/posts/presentation/admin_posts_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/user/account/presentation/account_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/user/cart/presentation/cart_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/user/home/presentation/home_presentation_imported_packages.dart';

abstract class BottomBarState extends Equatable {
  final int pageIndex;
  final adminPages = [
    const AdminPostsPage(),
    const AdminAnalyticsPage(),
    const AdminOrdersPage(),
  ];

  final userPages = [
    const HomePage(),
    const AccountPage(),
    const CartPage(),
  ];

   BottomBarState({required this.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}

class IntialState extends BottomBarState {
   IntialState({required super.pageIndex});
  @override
  List<Object?> get props => [pageIndex];
}

class ChangePageIndexState extends BottomBarState {
   ChangePageIndexState({required super.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}
