import 'package:agence_mifos/repository/groups/groups_repository.dart';
import 'package:agence_mifos/screens/groups/groups_controller.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import '../../data/groups/groups_provider.dart';

class GroupsBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);

    Get.lazyPut<GroupsProvider>(
      () => GroupsProvider(
        apiClient: Get.find<ApiClient>(),
      ),
      fenix: true,
    );

    Get.lazyPut<GroupsRepository>(
      () => GroupsRepository(
        clientProvider: Get.find<GroupsProvider>(),
      ),
      fenix: true,
    );
    
    Get.lazyPut(() => GroupsController(groupsRepository: Get.find<GroupsRepository>()), fenix: true);
  }
}