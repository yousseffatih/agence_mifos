import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/charges_client/charges_client_provider.dart';
import 'package:agence_mifos/repository/charges_client/charges_clients_repository.dart';
import 'package:agence_mifos/screens/charges_client/charges_client_controller.dart';
import 'package:get/get.dart';

class ChargesClientBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ApiClient(),fenix: true);
    Get.lazyPut(()=> ChargesClientProvider(apiClient: Get.find<ApiClient>()),fenix: true);
    Get.lazyPut(()=> ChargesClientsRepository(chargesClientProvider: Get.find<ChargesClientProvider>()),fenix: true);
    Get.lazyPut(()=> ChargesClientController(chargesClientsRepository: Get.find<ChargesClientsRepository>()),fenix: true);
  }
  
}