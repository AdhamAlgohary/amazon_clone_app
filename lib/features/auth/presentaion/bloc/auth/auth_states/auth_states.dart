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