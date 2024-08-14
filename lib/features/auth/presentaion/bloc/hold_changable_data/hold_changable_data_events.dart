import 'package:equatable/equatable.dart';

abstract class HoldChangableDataEvents extends Equatable {
  const HoldChangableDataEvents();

  @override
  List<Object> get props => [];
}

class SelectSignUpOrSignInEvent extends HoldChangableDataEvents {
  final String value;

  const SelectSignUpOrSignInEvent(this.value);

  @override
  List<Object> get props => [value];
}

class ToggleShowPasswordEvent extends HoldChangableDataEvents {
  final bool value;

  const ToggleShowPasswordEvent(this.value);

  @override
  List<Object> get props => [value];
}