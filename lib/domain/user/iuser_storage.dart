import 'package:calaton_fourth_project/domain/user/iuser.dart';

abstract interface class IUserStorage {
  Future<void> saveUser(IUser user);

  Future<IUser> getUser();

  Future<void> removeUser();
}
