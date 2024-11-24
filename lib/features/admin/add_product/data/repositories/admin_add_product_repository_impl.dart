import 'package:amazon_clone_app/core/core_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/data/admin_add_product_page_data_import_packages.dart';
import 'package:amazon_clone_app/features/admin/add_product/domain/admin_add_product_page_domain_import_packages.dart';
import 'package:dartz/dartz.dart';

class AdminAddProductRepositoryImpl extends AdminAddProductRepository {
  final NetworkInfo networkInfo;
  final AddProductRemoteDataSource addProductRemoteDataSource;

  const AdminAddProductRepositoryImpl(this.addProductRemoteDataSource,
      {required this.networkInfo});
  @override
  Future<Either<Failure, String>> addProduct(
          {required ProductEntity productEntity}) async =>
      Helper.performActionWithNetworkCheck<String>(
          networkInfo: networkInfo,
          action: () async {
            final Product productModel =
                _mapProductEntityToProductModel(productEntity: productEntity);
            final msgFromApi =
                await addProductRemoteDataSource.addProduct(productModel);
            return msgFromApi;
          });

  Product _mapProductEntityToProductModel(
          {required ProductEntity productEntity}) =>
      Product(
          productImgs: productEntity.productImgs,
          productName: productEntity.productName,
          productDescription: productEntity.productDescription,
          productPrice: productEntity.productPrice,
          productQuantity: productEntity.productQuantity,
          productCategory: productEntity.productCategory);
}
