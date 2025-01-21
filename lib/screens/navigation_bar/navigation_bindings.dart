import 'package:agence_mifos/screens/centers/centers_bindings.dart';
import 'package:agence_mifos/screens/clients/clients_bindings.dart';
import 'package:agence_mifos/screens/groups/groups_bindings.dart';
import 'package:agence_mifos/screens/search/search_bindings.dart';
import 'package:get/get.dart';

import 'navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController(), fenix: true);
    SearchBindings().dependencies();
    ClientsBindings().dependencies();
    CentersBindings().dependencies();
    GroupsBindings().dependencies();
  }
}