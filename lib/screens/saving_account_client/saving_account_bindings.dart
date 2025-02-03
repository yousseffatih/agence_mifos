import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/saving_account/saving_account_provider.dart';
import 'package:agence_mifos/repository/saving_account_client/saving_account_repository.dart';
import 'package:get/get.dart';

import 'saving_account_controller.dart';

class SavingAccountBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => SavingAccountProvider(apiClient: Get.find<ApiClient>()));
    Get.lazyPut(() => SavingAccountRepository(savingAccountProvider: Get.find<SavingAccountProvider>()));
    Get.lazyPut(() => SavingAccountController(savingAccountRepository: Get.find<SavingAccountRepository>()));
  }
  
}