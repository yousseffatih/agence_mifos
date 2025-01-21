import 'package:get/get.dart';

import '../../data/api_client.dart';
import '../../data/groups/groups_provider.dart';
import '../../repository/groups/groups_repository.dart';
import 'group_controller.dart';

class GroupBindings implements Bindings{
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
    
    Get.lazyPut(() => GroupController(groupsRepository: Get.find<GroupsRepository>()), fenix: true);
  
  }
  
}