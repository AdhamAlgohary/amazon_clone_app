import 'package:equatable/equatable.dart';

abstract class BottomBarCubitState extends Equatable {
  final int pageIndex;
  const BottomBarCubitState({required this.pageIndex});
  @override
  List<Object?> get props => [];
}

class IntialState extends BottomBarCubitState {
  const IntialState({required super.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}

class ChangePageIndexState extends BottomBarCubitState {
  const ChangePageIndexState({required super.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}
