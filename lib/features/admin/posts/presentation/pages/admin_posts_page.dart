import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/presentation/pages/admin_add_product_page.dart';
import 'package:flutter/material.dart';

import '../admin_posts_presentation_import_packages.dart';

class AdminPostsPage extends StatelessWidget {
  const AdminPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Helper.screenHeight(context: context);

    return OrientationBuilder(
        builder: (_, orientation) => Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton(
                onPressed: () => navigateToAddPostPage(context, orientation),
                child: const Icon(Icons.add),
              ),
              appBar: PreferredSize(
                  preferredSize: orientation == Orientation.portrait
                      ? Size.fromHeight(0.1 * screenHeight)
                      : Size.fromHeight(0.25 * screenHeight),
                  child: CustomAdminPostsPageAppBar(
                    orientation: orientation,
                  )),
            ));
  }
}

void navigateToAddPostPage(BuildContext context, Orientation orientation) =>
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => AdminAddProductPage(orientation: orientation)));
