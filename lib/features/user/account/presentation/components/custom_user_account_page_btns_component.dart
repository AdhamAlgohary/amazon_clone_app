import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/user/account/presentation/widgets/custom_user_account_page_btn_widget.dart';
import 'package:flutter/material.dart';

class CustomUserAccountPageBtnsComponent extends StatelessWidget {
  final Orientation orientation;

  const CustomUserAccountPageBtnsComponent({
    super.key,
    required this.orientation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomUserAccountPageBtnWidget(
              accountPageBtnOnPressed: () {},
              accountPageBtnTxt: AppConstantText.userAccountPageYourOrdersTxt,
            ),
            CustomUserAccountPageBtnWidget(
              accountPageBtnOnPressed: () {},
              accountPageBtnTxt: AppConstantText.userAccountPageTurnSellerBtnTxt,
            )
          ],
        ),
        Row(
          children: [
            CustomUserAccountPageBtnWidget(
              accountPageBtnOnPressed: () {},
              accountPageBtnTxt: AppConstantText.userAccountPageLogOutBtnTxt,
            ),
            CustomUserAccountPageBtnWidget(
              accountPageBtnOnPressed: () {},
              accountPageBtnTxt: AppConstantText.userAccountPageYourWishListBtnTxt,
            )
          ],
        )
      ],
    );
  }
}
