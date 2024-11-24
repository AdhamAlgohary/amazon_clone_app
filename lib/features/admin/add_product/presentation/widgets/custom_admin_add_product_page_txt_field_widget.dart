import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:flutter/material.dart';

class CustomAdminAddProductPageTxtFieldWidget extends StatelessWidget {
  final Orientation orientation;
  final String hintText;
  final int? maxLines;
  final TextEditingController textEditingController;
  const CustomAdminAddProductPageTxtFieldWidget({
    super.key,
    required this.orientation,
    required this.hintText,
    required this.textEditingController,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {

    return CustomTxtFormField(
      textEditingController: textEditingController,
      isObscure: false,
      hintText: hintText,
      maxLines: maxLines,
    );
  }
}
