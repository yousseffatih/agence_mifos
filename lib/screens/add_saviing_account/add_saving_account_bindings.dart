
import 'package:get/get.dart';

import '../../data/api_client.dart';
import '../../data/loan_account/add_saving_account_provider.dart';
import '../../repository/loan_account/add_saving_account_reppository.dart';
import 'add_saving_account_controller.dart';

class AddSavingAccountBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ApiClient());

    Get.lazyPut(()=> AddSavingAccountProvider(apiClient: Get.find<ApiClient>()), fenix: true);
    Get.lazyPut(()=> AddSavingAccountReppository(addSavingAccountProvider: Get.find<AddSavingAccountProvider>()), fenix: true);
    Get.lazyPut(()=> AddSavingAccountController(
      accountReppository : Get.find<AddSavingAccountReppository>()
    ), fenix: true);
  }
  
}