import 'package:agence_mifos/model/user.model.dart';

import '../../storage/storage_service.dart';
import '../api_client.dart';

class AuthProvider {
  ApiClient apiClient;
  StorageService storageService;

  AuthProvider({
    required this.apiClient,
    required this.storageService,
  });

  Future<dynamic> login(String email, String password) async {
    final response = await apiClient.post('/authentication', {
      'username': email,
      'password': password,
    });
    try {
      if (response.statusCode == 200) {
        final user = User.fromJson(response.data);
        await storageService.saveUser(user);
        return user;
      } else {
        return Exception("Not Authorized");
      }
    } catch (e) {
      rethrow;
    }
  }
}
