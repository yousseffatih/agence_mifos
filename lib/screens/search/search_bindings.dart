import 'package:agence_mifos/data/search/search_provider.dart';
import 'package:agence_mifos/repository/search/search_repository.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import 'search_controller.dart';

class SearchBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);

    Get.lazyPut<SearchProvider>(
      () => SearchProvider(
        apiClient: Get.find<ApiClient>(),
      ),
      fenix: true,
    );

    Get.lazyPut<SearchRepository>(
      () => SearchRepository(
        searchProvider: Get.find<SearchProvider>(),
      ),
      fenix: true,
    );
    
    Get.lazyPut(() => SearchControle(searchRepository: Get.find<SearchRepository>()), fenix: true);
  }
}