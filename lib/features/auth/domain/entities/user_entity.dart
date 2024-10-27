import 'package:equatable/equatable.dart';

 class UserEntity extends Equatable {
  final String? name;
  final String email;
  final String password;
  final String? address;
  final String? type;
  final String? token;

  const UserEntity(
      {this.name,
      required this.email,
      required this.password,
      this.address,
      this.type,
      this.token});

  @override
  List<Object?> get props => [name, email, password, address, type, token];

}
