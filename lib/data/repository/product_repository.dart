import 'package:calaton_fourth_project/data/product/product.dart';
import 'package:calaton_fourth_project/domain/product/iproduct_repository.dart';


import '../../app/services/networking/network_service.dart';
import '../../domain/product/iproduct.dart';

class ProductRepository implements IProductRepository {
  final NetworkService _networkService;

  ProductRepository({required NetworkService networkService})
      : _networkService = networkService;

  @override
  Future<List<IProduct>> getAllProduct() {
    try {
      return _networkService.getRequest((json) {
        var res = json;
        return res
            .map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();
      });
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
