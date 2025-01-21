import 'package:agence_mifos/screens/centers/centers_controller.dart';
import 'package:agence_mifos/screens/groups/groups_controller.dart';
import 'package:get/get.dart';

import '../clients/clients_controller.dart';
import '../search/search_controller.dart';

class NavigationController extends GetxController {
  final _selectedIndex = 0.obs;
  
  int get selectedIndex => _selectedIndex.value;
  
  void changeIndex(int index) {
    _selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.find<SearchControle>().onInit();
        break;
      case 1:
        Get.find<ClientsController>().onInit();
        break;
      case 2:
        Get.find<CentersController>().onInit();
      case 3:
        Get.find<GroupsController>().onInit();
    }
  }
}