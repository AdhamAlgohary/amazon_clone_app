import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final List<String> productImgs;
  final String productName;
  final String productDescription;
  final double productPrice;
  final int productQuantity;
  final String productCategory;

  const ProductEntity(
      {required this.productImgs,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productQuantity,
      required this.productCategory});
  @override
  List<Object?> get props => [
        productImgs,
        productName,
        productDescription,
        productPrice,
        productQuantity,
        productCategory
      ];
}
