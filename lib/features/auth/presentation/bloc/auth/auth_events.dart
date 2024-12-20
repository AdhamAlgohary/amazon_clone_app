import 'package:amazon_clone_app/features/auth/domain/entities/user_entity.dart';

import 'package:equatable/equatable.dart';

abstract class AuthEvents extends Equatable {
  const AuthEvents();
}

class SignUpEvent extends AuthEvents {
  final UserEntity user;
  const SignUpEvent({required this.user});
  @override
  List<Object?> get props => [user];
}

class SignInEvent extends AuthEvents {
  final UserEntity user;
  const SignInEvent({required this.user});
  @override
  List<Object?> get props => [user];
}

class GetUserDataEvent extends AuthEvents{
 final String userToken;
  const GetUserDataEvent({required this.userToken});
  @override
  List<Object?> get props =>[userToken];
}