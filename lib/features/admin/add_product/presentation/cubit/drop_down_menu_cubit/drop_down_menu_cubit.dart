import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/presentation/admin_add_product_page_presentation_import_packages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownMenuCubit extends Cubit<DropDownMenuState> {
  DropDownMenuCubit()
      : super(const DropDownBtnIntialState(
            dropDownBtnValue: AppConstantText.mobilesCategoryTxt));

  void changeDropDownBtnValue({required String newValue}) =>
      emit(ChangeDropDownBtnValueState(dropDownBtnValue: newValue));
}
