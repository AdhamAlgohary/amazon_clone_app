import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/presentation/admin_add_product_page_presentation_import_packages.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAdminAddProductDottedContainerComponent extends StatelessWidget {
  final Orientation orientation;
  const CustomAdminAddProductDottedContainerComponent(
      {super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Helper.screenHeight(context: context);
    final screenWidth = Helper.screenWidth(context: context);
    final orientationCondition = orientation == Orientation.portrait;

    return GestureDetector(
      onTap: () => pickImages(context: context),
      child:  DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(0.03 * screenWidth),
              dashPattern: const [10, 4],
              strokeWidth: 0.005 * screenWidth,
              child: SizedBox(
                  height: orientationCondition
                      ? 0.15 * screenHeight
                      : 0.4 * screenHeight,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.folder_open,
                          size: orientationCondition
                              ? 0.1 * screenWidth
                              : 0.08 * screenWidth,
                        ),
                        SizedBox(
                          height: 0.01 * screenHeight,
                        ),
                        Text(
                          AppConstantText
                              .adminAddProductPageSelectProductImagesTxt,
                          style: AppTextStyle.smallBodyTxtStyle(
                              context: context,
                              fontSize: !orientationCondition
                                  ? 0.03 * screenWidth
                                  : 0.04 * screenWidth,
                              fontWeight: FontWeight.bold,
                              color: LightPalletColor.lightDisableOrHintItem),
                        )
                      ],
                    ),
                  )))
    );
  }
}

void pickImages({required BuildContext context}) =>
    context.read<PickImagesCubit>().pickImageFromGallery();
