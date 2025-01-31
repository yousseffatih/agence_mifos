import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/pintpoint_client/pintpoint_client_provider.dart';
import 'package:agence_mifos/repository/pintpoint_client/pintpoint_client_repository.dart';
import 'package:agence_mifos/screens/pintpoint_client/pintpoint_client_controller.dart';
import 'package:get/get.dart';

class PintpointClietBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ApiClient());
    Get.lazyPut(()=> PintpointClientProvider(apiClient: Get.find<ApiClient>()));
    Get.lazyPut(()=> PintpointClientRepository(pintpointClientProvider: Get.find<PintpointClientProvider>()));
    Get.lazyPut(()=> PintpointClientController(pintpointClientRepository: Get.find<PintpointClientRepository>()));
  }
  
}