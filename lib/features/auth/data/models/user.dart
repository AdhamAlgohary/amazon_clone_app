import "package:amazon_clone_app/features/auth/domian/entities/user_entity.dart";
import "package:json_annotation/json_annotation.dart";

part "user.g.dart";

@JsonSerializable()
class User extends UserEntity {
   const User({super.name,required super.email,required super.password}
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
