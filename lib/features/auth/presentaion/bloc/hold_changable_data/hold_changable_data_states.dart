import 'package:equatable/equatable.dart';

 class HoldChangableDataStates extends Equatable {
  final String selectedSignInOrSignUp;
  final bool selectedShowPasswordOrNot;
  const HoldChangableDataStates(
       {this.selectedSignInOrSignUp='Create Account',
       this.selectedShowPasswordOrNot=false});

  // HoldChangableDataStates copyWith({
  //   String? selectedSignInOrSignUp,
  //   bool? selectedShowPasswordOrNot,
  // }) {
  //   return HoldChangableDataStates(
  //     selectedSignInOrSignUp:
  //         selectedSignInOrSignUp ?? this.selectedSignInOrSignUp,
  //     selectedShowPasswordOrNot:
  //         selectedShowPasswordOrNot ?? this.selectedShowPasswordOrNot,
  //   );
  // }

  @override
  List<Object> get props => [selectedSignInOrSignUp,selectedShowPasswordOrNot];
}

// class InitialState extends HoldChangableDataStates {
//   const InitialState()
//       : super(
//             selectedSignInOrSignUp: 'Create Account',
//             selectedShowPasswordOrNot: false);
// }

// class SelectSignUpOrSignInState extends HoldChangableDataStates {
//   final String selectedSignInOrSignUp;
//   const SelectSignUpOrSignInState({required this.selectedSignInOrSignUp}):super(selectedSignInOrSignUp: selectedSignInOrSignUp,selectedShowPasswordOrNot: );
// }

// class ShowPasswordOrNotState extends HoldChangableDataStates {
//   final bool selectedShowPasswordOrNot;
//   const ShowPasswordOrNotState({required this.selectedShowPasswordOrNot}):super(selectedShowPasswordOrNot: selectedShowPasswordOrNot,selectedSignInOrSignUp: );
// }
