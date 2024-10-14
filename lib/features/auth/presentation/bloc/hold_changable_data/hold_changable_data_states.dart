import 'package:equatable/equatable.dart';

 class HoldChangableDataStates extends Equatable {
  final String selectedSignInOrSignUp;
  final bool selectedShowPasswordOrNot;
  const HoldChangableDataStates(
       {this.selectedSignInOrSignUp='Create Account',
       this.selectedShowPasswordOrNot=false});


  @override
  List<Object> get props => [selectedSignInOrSignUp,selectedShowPasswordOrNot];
}

