import 'package:equatable/equatable.dart';

abstract class HoldChangableDataEvents extends Equatable {
  const HoldChangableDataEvents();

  @override
  List<Object> get props => [];
}

class SelectedOrNotSelectedEvent extends HoldChangableDataEvents {
  final String selectedSignUpOrSignInValue;
  final bool selectedShowPasswordOrNotValue;

  const SelectedOrNotSelectedEvent(
      {required this.selectedSignUpOrSignInValue,
      required this.selectedShowPasswordOrNotValue});

  @override
  List<Object> get props => [selectedSignUpOrSignInValue,selectedShowPasswordOrNotValue];
}


