import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/upload_signature/upload_signature_provider.dart';
import 'package:agence_mifos/repository/upload_signature/upload_signature_repository.dart';
import 'package:agence_mifos/screens/upload_signature/upload_signature_controller.dart';
import 'package:get/get.dart';

class UploadSignatureBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ApiClient());
    Get.lazyPut(()=> UploadSignatureProvider(apiClient: Get.find<ApiClient>()));
    Get.lazyPut(()=> UploadSignatureRepository(uploadSignatureProvider: Get.find<UploadSignatureProvider>()));
    Get.lazyPut(()=> UploadSignatureController(uploadSignatureRepository: Get.find<UploadSignatureRepository>()));
  }
  
}