import 'package:amazon_clone_app/core/core_import_packages.dart';
import '../admin_add_product_page_domain_import_packages.dart';

import 'package:dartz/dartz.dart';

abstract class AdminAddProductRepository {
  const AdminAddProductRepository();
  Future<Either<Failure, String>> addProduct(
      {required ProductEntity productEntity});
}
