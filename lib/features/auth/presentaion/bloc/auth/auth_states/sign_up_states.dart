import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/auth_states.dart';

abstract class SignUpStates extends AuthStates {
  const SignUpStates();
}

class DoneMessageCreateUserState extends SignUpStates {
  final String msgFromApi;
  const DoneMessageCreateUserState({required this.msgFromApi});
  @override
  List<Object?> get props => [msgFromApi];
}

class ErrorCreateUserState extends SignUpStates {
  final String failedMsg;
  const ErrorCreateUserState({required this.failedMsg});
  @override
  List<Object?> get props => [failedMsg];
}
