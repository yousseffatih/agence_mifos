import 'package:agence_mifos/data/client/client_provider.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import '../../repository/clients/client_repository.dart';
import 'clients_controller.dart';

class ClientsBindings implements Bindings{
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
    
    Get.lazyPut(() => ClientsController(clientRepository: Get.find<ClientRepository>()), fenix: true);
  }
}