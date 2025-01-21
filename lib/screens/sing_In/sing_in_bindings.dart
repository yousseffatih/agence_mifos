import 'package:agence_mifos/repository/auth/auth_repository.dart';
import 'package:agence_mifos/screens/sing_In/sing_up_controller.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import '../../data/auth/Authentification_provider.dart';
import '../../storage/storage_service.dart';

class SingInBindings implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ApiClient(), fenix: true);
   Get.lazyPut(() => StorageService(), fenix: true);

   Get.lazyPut<AuthProvider>(
      () => AuthProvider(
        apiClient: Get.find<ApiClient>(),
        storageService: Get.find<StorageService>(),
      ),
      fenix: true,
    );

  Get.lazyPut<AuthRepository>(
      () => AuthRepository(
        authProvider: Get.find<AuthProvider>(),
      ),
      fenix: true,
    );
  Get.lazyPut(
      () => SignUpController(repository: Get.find<AuthRepository>()),
      fenix: true,
    );
  }
  
}