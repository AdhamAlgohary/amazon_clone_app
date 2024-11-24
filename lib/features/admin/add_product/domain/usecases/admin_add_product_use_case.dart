import 'package:amazon_clone_app/core/error/failure.dart';
import 'package:amazon_clone_app/features/admin/add_product/domain/admin_add_product_page_domain_import_packages.dart';
import 'package:dartz/dartz.dart';

class AdminAddProductUseCase {
  final AdminAddProductRepository _repository;

  const AdminAddProductUseCase(this._repository);

  Future<Either<Failure, String>> call(
          {required ProductEntity productEntity}) async =>
      await _repository.addProduct(productEntity: productEntity);
}
