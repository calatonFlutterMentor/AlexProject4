import '../../../data/repository/user_repository.dart';
import '../../common/base_change_notifier.dart';

class LoginViewModel extends BaseChangeNotifier {
  final UserRepository _userRepository;

  LoginViewModel({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<void> onLogInButtonPressed(String email, String password) async {
    startLoading();
    await _userRepository.singIn(email, password);
    stopLoading();
  }
}