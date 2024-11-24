
import 'package:equatable/equatable.dart';

abstract class UserAccountState extends Equatable {
  const UserAccountState();  

  @override
  List<Object> get props => [];
}
class UserAccountInitial extends UserAccountState {}
