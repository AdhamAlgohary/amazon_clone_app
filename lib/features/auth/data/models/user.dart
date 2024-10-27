import "package:amazon_clone_app/features/auth/domain/domain_import_packages.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

part "user.g.dart";

@JsonSerializable()
@HiveType(typeId: 0)
class User extends UserEntity {
  const User(
      {@HiveField(0) super.name,
      @HiveField(1) required super.email,
      @HiveField(2) required super.password,
      @HiveField(3) super.address,
      @HiveField(4) super.type,
      @HiveField(5)  super.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
