import 'package:get/get.dart';

import '../../data/api_client.dart';
import '../../data/centers/centers_provider.dart';
import '../../repository/centers/centers_repository.dart';
import 'center_controller.dart';

class CenterBindings implements Bindings{
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
    
    Get.lazyPut(() => CenterController(centersRepository: Get.find<CentersRepository>()), fenix: true);
  }
  
}