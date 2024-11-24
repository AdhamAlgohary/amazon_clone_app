import 'package:amazon_clone_app/features/admin/add_product/data/admin_add_product_page_data_import_packages.dart';

abstract class AddProductRemoteDataSource {
  const AddProductRemoteDataSource();
  Future<String> addProduct(Product product);
}
