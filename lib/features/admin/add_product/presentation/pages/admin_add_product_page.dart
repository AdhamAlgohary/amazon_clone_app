import 'package:amazon_clone_app/config/config_import_packages.dart';
import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/presentation/admin_add_product_page_presentation_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/presentation/widgets/custom_admin_add_product_page_drop_down_menu_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAddProductPage extends StatefulWidget {
  final Orientation orientation;
  const AdminAddProductPage({super.key, required this.orientation});

  @override
  State<AdminAddProductPage> createState() => _AdminAddProductPageState();
}

class _AdminAddProductPageState extends State<AdminAddProductPage> {
  late final TextEditingController _productNameTextEditingController;
  late final TextEditingController _descrpitionTextEditingController;
  late final TextEditingController _priceTextEditingController;
  late final TextEditingController _quantityTextEditingController;

  @override
  void initState() {
    _productNameTextEditingController = TextEditingController();
    _descrpitionTextEditingController = TextEditingController();
    _priceTextEditingController = TextEditingController();
    _quantityTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _productNameTextEditingController.dispose();
    _descrpitionTextEditingController.dispose();
    _priceTextEditingController.dispose();
    _quantityTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = Helper.screenHeight(context: context);
    final screenWidth = Helper.screenWidth(context: context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: widget.orientation == Orientation.portrait
              ? Size.fromHeight(0.1 * screenHeight)
              : Size.fromHeight(0.25 * screenHeight),
          child: CustomAdminAddProductPageAppBar(
            orientation: widget.orientation,
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0.02 * screenWidth),
        child: Form(
            child: SizedBox(
          height: 0.8 * screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<PickImagesCubit, PickImagesState>(
                  builder: (_, state) => _blocBuilderBuildContent(
                      screenHeight: screenHeight,
                      state: state,
                      orientation: widget.orientation)),
              CustomAdminAddProductPageTxtFieldWidget(
                orientation: widget.orientation,
                textEditingController: _productNameTextEditingController,
                hintText: AppConstantText.adminAddProductPageProductNameTxt,
              ),
              CustomAdminAddProductPageTxtFieldWidget(
                orientation: widget.orientation,
                textEditingController: _descrpitionTextEditingController,
                hintText: AppConstantText.adminAddProductPageDescriptionTxt,
                maxLines: 7,
              ),
              CustomAdminAddProductPageTxtFieldWidget(
                  orientation: widget.orientation,
                  textEditingController: _priceTextEditingController,
                  hintText: AppConstantText.adminAddProductPagePriceTxt),
              CustomAdminAddProductPageTxtFieldWidget(
                  orientation: widget.orientation,
                  textEditingController: _quantityTextEditingController,
                  hintText: AppConstantText.adminAddProductPageQuantityTxt),
              BlocBuilder<DropDownMenuCubit, DropDownMenuState>(
                  builder: (_, state) =>
                      CustomAdminAddProductPageDropDownMenuWidget(
                        state: state,
                      )),
              ElevatedButton(
                  onPressed: () {},
                  child: const CustomBoldTxt(
                    text: AppConstantText.adminAddProductPageSellTxt,
                    textColor: LightPalletColor.lightOnSecondary,
                  ))
            ],
          ),
        )),
      ),
    );
  }
}

Widget _blocBuilderBuildContent(
    {required double screenHeight,
    required PickImagesState state,
    required Orientation orientation}) {
  return state is PickImagesIntialState || state.images.isEmpty
      ? CustomAdminAddProductDottedContainerComponent(
          orientation: orientation,
        )
      : CustomCarouselImage(
          orientation: orientation,
          carouselHeight: 0.2 * screenHeight,
          carouselImgs: state.images.map((item) {
            return Image.file(
              item,
              width: double.infinity,
              fit: BoxFit.fill,
            );
          }).toList());
}
