import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/identifier_client/identifier_client_provider.dart';
import 'package:agence_mifos/repository/identifier_client/identifier_client_repository.dart';
import 'package:agence_mifos/screens/identifier_client/identifier_client_controller.dart';
import 'package:get/get.dart';

class IdentifierClientBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ApiClient());
    Get.lazyPut(()=> IdentifierClientProvider(apiClient: Get.find<ApiClient>()));
    Get.lazyPut(()=> IdentifierClientRepository(identifierClientProvider: Get.find<IdentifierClientProvider>()));
    Get.lazyPut(()=> IdentifierClientController(identifierClientRepository: Get.find<IdentifierClientRepository>()));
  }
  
}