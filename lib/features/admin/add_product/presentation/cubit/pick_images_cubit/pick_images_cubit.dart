import 'package:amazon_clone_app/features/admin/add_product/presentation/admin_add_product_page_presentation_import_packages.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImagesCubit extends Cubit<PickImagesState> {
  PickImagesCubit() : super(const PickImagesIntialState(images: []));

  void pickImageFromGallery() async {
    emit(const PickImagesLoadingState(images: []));

    List<File> selectedImagesFromGallery = [];
    try {
      final imagesPicker = ImagePicker();
      final List<XFile> returnedImages = await imagesPicker.pickMultiImage();
      if (returnedImages.isNotEmpty) {
        for (var i = 0; i < returnedImages.length; i++) {
          selectedImagesFromGallery.add(File(returnedImages[i].path));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    emit(PickImagesAddImagesState(images: selectedImagesFromGallery));
  }
}
