import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class PickImagesState extends Equatable {
  final List<File> images;

  const PickImagesState({required this.images});
  @override
  List<Object?> get props => [images];
}

class PickImagesIntialState extends PickImagesState {
  const PickImagesIntialState({required super.images});
  @override
  List<Object?> get props => [images];
}

class PickImagesLoadingState extends PickImagesState{
  const PickImagesLoadingState({required super.images});
  @override
  List<Object?> get props => [images];
}

class PickImagesAddImagesState extends PickImagesState{
  const PickImagesAddImagesState({required super.images});
  @override
  List<Object?> get props => [images];
}
