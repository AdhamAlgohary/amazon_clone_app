import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final String? userToken;
  final String? id;
  final String? address;
  final String? type;

  const UserEntity({
    this.userToken,
    this.id,
    this.address,
    this.type,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password, id, address, type];
}
