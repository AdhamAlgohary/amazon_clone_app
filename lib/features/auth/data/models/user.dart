import "package:amazon_clone_app/features/auth/domian/entities/user_entity.dart";
import "package:json_annotation/json_annotation.dart";

part "user.g.dart";

@JsonSerializable()
class User extends UserEntity {
  const User(String name, String email, String password, String userToken,
      String id, String address, String type)
      : super(name: name, email: email, password: password);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
