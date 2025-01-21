import 'package:agence_mifos/data/centers/centers_provider.dart';
import 'package:agence_mifos/repository/centers/centers_repository.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import 'centers_controller.dart';

class CentersBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);

    Get.lazyPut<CentersProvider>(
      () => CentersProvider(
        apiClient: Get.find<ApiClient>(),
      ),
      fenix: true,
    );

    Get.lazyPut<CentersRepository>(
      () => CentersRepository(
        centersProvider: Get.find<CentersProvider>(),
      ),
      fenix: true,
    );
    
    Get.lazyPut(() => CentersController(centersRepository: Get.find<CentersRepository>()), fenix: true);
  }
  
}