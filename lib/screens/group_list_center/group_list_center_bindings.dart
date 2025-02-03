import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/group_list_center/group_list_center_provider.dart';
import 'package:agence_mifos/repository/group_list_center/group_list_center_repository.dart';
import 'package:agence_mifos/screens/group_list_center/group_list_center_controller.dart';
import 'package:get/get.dart';

class GroupListCenterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => GroupListCenterProvider(apiClient: Get.find<ApiClient>()));
    Get.lazyPut(() => GroupListCenterRepository(groupListCenterProvider: Get.find<GroupListCenterProvider>()));
    Get.lazyPut(() => GroupListCenterController(groupListCenterRepository: Get.find<GroupListCenterRepository>()));
  }
  
}