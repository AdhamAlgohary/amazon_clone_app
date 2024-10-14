import 'package:equatable/equatable.dart';

abstract class AuthStates extends Equatable {
  const AuthStates();
}

class InitialState extends AuthStates {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AuthStates {
  @override
  List<Object?> get props => [];
}

class FailedState extends AuthStates {
  final String failedMsg;

  const FailedState({required this.failedMsg});

  @override
  List<Object?> get props => [failedMsg];

}

class SuccessfulLoginState extends AuthStates {

  const SuccessfulLoginState();
  
  @override
  List<Object?> get props => [];
}

class MessageCreateUserState extends AuthStates {
  final String msgFromApi;
  
  const MessageCreateUserState({required this.msgFromApi});
  
  @override
  List<Object?> get props => [msgFromApi];
}
