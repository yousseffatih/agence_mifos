import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/pinppoint_client/pinpoint_provider.dart';
import 'package:agence_mifos/repository/pinpoint_client/pinpoint_client_repository.dart';
import 'package:agence_mifos/screens/pinpoint_client/pinpoint_client_controller.dart';
import 'package:get/get.dart';

class PinpointClientBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ApiClient());
    Get.lazyPut(()=> PinpointProvider(apiClient: Get.find<ApiClient>()));
    Get.lazyPut(()=> PinpointClientRepository(pinpointProvider: Get.find<PinpointProvider>()));
    Get.lazyPut(()=> PinpointClientController(pinpointClientRepository: Get.find<PinpointClientRepository>()));
  }
  
}