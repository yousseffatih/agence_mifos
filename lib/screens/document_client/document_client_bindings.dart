import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/document_client/document_client_provider.dart';
import 'package:agence_mifos/repository/document_client/document_client_repository.dart';
import 'package:agence_mifos/screens/document_client/document_client_controller.dart';
import 'package:get/get.dart';

class DocumentClientBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ApiClient());
    Get.lazyPut(()=> DocumentClientProvider(apiClient: Get.find<ApiClient>()));
    Get.lazyPut(()=> DocumentClientRepository(documentClientProvider: Get.find<DocumentClientProvider>()));
    Get.lazyPut(()=> DocumentClientController(documentClientRepository: Get.find<DocumentClientRepository>()));
  }
}