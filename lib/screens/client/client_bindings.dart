import 'package:agence_mifos/screens/client/client_controller.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import '../../data/client/client_provider.dart';
import '../../repository/clients/client_repository.dart';

class ClientBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);

    Get.lazyPut<ClientProvider>(
      () => ClientProvider(
        apiClient: Get.find<ApiClient>(),
      ),
      fenix: true,
    );

    Get.lazyPut<ClientRepository>(
      () => ClientRepository(
        clientProvider: Get.find<ClientProvider>(),
      ),
      fenix: true,
    );

    Get.lazyPut(() => ClientController(clientRepository: Get.find<ClientRepository>()), fenix: true);

  }
  
}