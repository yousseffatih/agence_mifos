import 'package:agence_mifos/data/api_client.dart';

import 'package:get/get.dart';

import '../../data/surveys/pintpoint_client_provider.dart';
import '../../repository/surveys/pintpoint_client_repository.dart';
import 'surveys_client_controller.dart';

class SurveysClientBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ApiClient());
    Get.lazyPut(()=> SurveysClientProvider(apiClient: Get.find<ApiClient>()));
    Get.lazyPut(()=> SurveysClientRepository(surveysClientProvider: Get.find<SurveysClientProvider>()));
    Get.lazyPut(()=> SurveysClientController(surveysClientRepository: Get.find<SurveysClientRepository>()));
  }
  
}