import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/presentation/admin_add_product_page_presentation_import_packages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCarouselImage extends StatelessWidget {
  final Orientation orientation;
  final List<Widget> carouselImgs;
  final double? carouselHeight;
  final void Function()? gestureDetectorOnTapFunc;
  const CustomCarouselImage(
      {super.key,
      required this.orientation,
      required this.carouselImgs,
      this.carouselHeight,
      this.gestureDetectorOnTapFunc});

  @override
  Widget build(BuildContext context) {
    final screenHeight = Helper.screenHeight(context: context);
    final orientationCondition = orientation == Orientation.portrait;

    return GestureDetector(
      onTap: () => gestureDetectorOnTapFunc ?? pickImages(context: context),
      child: CarouselSlider(
        items: carouselImgs,
        options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            height: orientationCondition
                ? carouselHeight ?? 0.3 * screenHeight
                : 0.5 * screenHeight),
      ),
    );
  }
}

void pickImages({required BuildContext context}) =>
    context.read<PickImagesCubit>().pickImageFromGallery();
