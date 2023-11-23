
abstract interface class ILocalStorage {
  Future<void> put(dynamic data);

  Future<dynamic> get();

  Future<void> removeAll();
}