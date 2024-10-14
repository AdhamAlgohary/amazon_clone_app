import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/account/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenSize.screenHeight(context: context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.1 * screenHeight),
          child: const CustomAppBar()), 
      body: const Center(
        child: Text('Account page'),
      ),
    );
  }
}
