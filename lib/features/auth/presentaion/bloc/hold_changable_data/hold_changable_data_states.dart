import 'package:equatable/equatable.dart';

class HoldChangableDataStates extends Equatable {
  final String selectedSignInOrSignUp;
  final bool selectedShowPasswordOrNot;

  const HoldChangableDataStates({
    this.selectedSignInOrSignUp = "Create Account",
    this.selectedShowPasswordOrNot = false,
  });

  HoldChangableDataStates copyWith({
    String? selectedSignInOrSignUp,
    bool? selectedShowPasswordOrNot,
  }) {
    return HoldChangableDataStates(
      selectedSignInOrSignUp:
          selectedSignInOrSignUp ?? this.selectedSignInOrSignUp,
      selectedShowPasswordOrNot:
          selectedShowPasswordOrNot ?? this.selectedShowPasswordOrNot,
    );
  }

  @override
  List<Object> get props => [selectedSignInOrSignUp, selectedShowPasswordOrNot];
}
