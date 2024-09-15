import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/auth_states.dart';

abstract class SignUpStates extends AuthStates {
  const SignUpStates();
}

class DoneMessageSignInUserState extends SignUpStates {
  const DoneMessageSignInUserState();
  @override
  List<Object?> get props => [];
}

class ErrorSignInState extends SignUpStates {
  final String failedMsg;
  const ErrorSignInState({required this.failedMsg});
  @override
  List<Object?> get props => [failedMsg];
}
