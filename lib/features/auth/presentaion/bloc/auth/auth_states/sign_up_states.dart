import 'package:amazon_clone_app/features/auth/presentaion/bloc/auth/auth_states/auth_states.dart';

abstract class SignUpStates extends AuthStates {
  const SignUpStates();
}

class MessageCreateUserState extends SignUpStates {
  final String msgFromApi;
  
  const MessageCreateUserState({required this.msgFromApi});
  
  @override
  List<Object?> get props => [msgFromApi];
}


