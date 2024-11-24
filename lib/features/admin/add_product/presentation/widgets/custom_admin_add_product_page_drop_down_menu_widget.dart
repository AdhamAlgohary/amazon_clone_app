import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/presentation/admin_add_product_page_presentation_import_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAdminAddProductPageDropDownMenuWidget extends StatelessWidget {
  final DropDownMenuState state;
  const CustomAdminAddProductPageDropDownMenuWidget(
      {super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Helper.screenWidth(context: context);
    return DropdownButton(
        value: state.dropDownBtnValue,
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        padding: EdgeInsets.only(right: 0.67 * screenWidth),
        items: GlobalVariables.productCategory
            .map<DropdownMenuItem<String>>((item) {
          return DropdownMenuItem(
            value: item['categoryTitle'],
            child: Text('${item['categoryTitle']}'),
          );
        }).toList(),
        onChanged: <String>(newVal) =>
            dropDownBtnOnChanged(context: context, newVal: newVal));
  }
}

void dropDownBtnOnChanged(
        {required BuildContext context, required String newVal}) =>
    context.read<DropDownMenuCubit>().changeDropDownBtnValue(newValue: newVal);
