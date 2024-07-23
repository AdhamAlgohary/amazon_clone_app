import 'package:amazon_clone_app/features/auth/domian/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpStates extends Equatable {
  const SignUpStates();
}

class InitialState extends SignUpStates {
  @override
  List<Object?> get props => [];
}

class LoadingState extends SignUpStates {
  @override
  List<Object?> get props => [];
}

class CreateUserSuccessfullyState extends SignUpStates {
  final UserEntity user;
  const CreateUserSuccessfullyState({required this.user});
  @override
  List<Object?> get props => [user];
}

class ErrorCreateUserState extends SignUpStates {
  final String msg;
  const ErrorCreateUserState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
