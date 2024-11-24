import 'package:equatable/equatable.dart';

abstract class DropDownMenuState extends Equatable {
  final String dropDownBtnValue;

  const DropDownMenuState({required this.dropDownBtnValue});
  @override
  List<Object?> get props => [dropDownBtnValue];
}

class DropDownBtnIntialState extends DropDownMenuState {
  const DropDownBtnIntialState({required super.dropDownBtnValue});

  @override
  List<Object?> get props => [dropDownBtnValue];
}

class ChangeDropDownBtnValueState extends DropDownMenuState {
  const ChangeDropDownBtnValueState({required super.dropDownBtnValue});

  @override
  List<Object?> get props => [dropDownBtnValue];
}
