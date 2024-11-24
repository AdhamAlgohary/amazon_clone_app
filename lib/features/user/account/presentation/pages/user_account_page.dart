import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/user/account/presentation/account_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/user/account/presentation/components/custom_user_account_page_orders_component.dart';

import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Helper.screenHeight(context: context);

    return OrientationBuilder(
      builder: (_, orientation) => Scaffold(
        appBar: PreferredSize(
            preferredSize: orientation == Orientation.portrait
                ? Size.fromHeight(0.1 * screenHeight)
                : Size.fromHeight(0.25 * screenHeight),
            child: CustomUserAccountPageAppBar(
              orientation: orientation,
            )),
        body: ListView(children: [
          CustomUserAccountPageBtnsComponent(
            orientation: orientation,
          ),
          CustomUserAccountPageOrdersComponent(
            orientation: orientation,
          ),
        ]),
      ),
    );
  }
}
