import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/account/presentation/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class AccountPageBtns extends StatelessWidget {
  final Orientation orientation;

  const AccountPageBtns({
    super.key,
    required this.orientation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomBtn(
              accountPageBtnOnPressed: () {},
              accountPageBtnTxt: AppConstantText.accountPageYourOrdersTxt,
            ),
            CustomBtn(
              accountPageBtnOnPressed: () {},
              accountPageBtnTxt: AppConstantText.accountPageTurnSellerBtnTxt,
            )
          ],
        ),
        Row(
          children: [
            CustomBtn(
              accountPageBtnOnPressed: () {},
              accountPageBtnTxt: AppConstantText.accountPageLogOutBtnTxt,
            ),
            CustomBtn(
              accountPageBtnOnPressed: () {},
              accountPageBtnTxt: AppConstantText.accountPageYourWishListBtnTxt,
            )
          ],
        )
      ],
    );
  }
}
