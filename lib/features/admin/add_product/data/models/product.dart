import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/admin_add_product_page_domain_import_packages.dart';

part 'product.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Product extends ProductEntity {
  const Product(
      {@HiveField(0) required super.productImgs,
      @HiveField(1) required super.productName,
      @HiveField(2) required super.productDescription,
      @HiveField(3) required super.productPrice,
      @HiveField(4) required super.productQuantity,
      @HiveField(5) required super.productCategory});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
