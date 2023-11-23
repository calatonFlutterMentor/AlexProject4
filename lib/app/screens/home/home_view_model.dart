import 'package:calaton_fourth_project/data/repository/product_repository.dart';

import '../../../data/repository/user_repository.dart';
import '../../../domain/product/iproduct.dart';
import '../../../domain/user/iuser.dart';
import '../../common/base_change_notifier.dart';

class HomeViewModel extends BaseChangeNotifier {
  final ProductRepository _productRepository;
  final UserRepository _userRepository;

  HomeViewModel(
      {required ProductRepository productRepository,
      required UserRepository userRepository})
      : _productRepository = productRepository,
        _userRepository = userRepository;

  Future<void> onLogOutButtonPressed() async {
    await _userRepository.logOut();
    notifyListeners();
  }
  Future<IUser> getUser() async {
    return await _userRepository.getUser();
  }
  Future<List<IProduct>> getAllProduct() async {
    final List<IProduct> productList = await _productRepository.getAllProduct();
    print(productList.length);
    return await _productRepository.getAllProduct();
  }
}
