import '../../data/product/product.dart';
import 'iproduct.dart';

abstract class IProductRepository {
  Future<List<IProduct>> getAllProduct();

}