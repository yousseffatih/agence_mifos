
import 'package:get_storage/get_storage.dart';

import '../model/user.model.dart';

class StorageService {
  final storage = GetStorage();

  Future<void> saveUser(User user) async {
    await storage.write('user_auth', user.toJson());
    await storage.write('token', user.base64EncodedAuthenticationKey);
  }

  Future<void> clearUser() async {
    await storage.erase();
  }

  User? getUser() {
    final userData = storage.read('user_auth');
    print(userData);
    return userData != null ? User.fromJson(userData) : null;
  }

  String? getToken() {
    return storage.read('token');
  }
}