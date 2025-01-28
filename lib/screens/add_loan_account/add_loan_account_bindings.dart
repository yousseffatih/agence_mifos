import 'package:agence_mifos/data/api_client.dart';
import 'package:agence_mifos/data/loan_account/add_loan_provider.dart';
import 'package:agence_mifos/repository/loan_account/add_loan_repository.dart';
import 'package:get/get.dart';

import 'add_loan_account_controller.dart';

class AddLoanAccountBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ApiClient());

    Get.lazyPut(()=> AddLoanProvider(apiClient: Get.find<ApiClient>()), fenix: true);
    Get.lazyPut(()=> AddLoanRepository(addLoanProvider: Get.find<AddLoanProvider>()), fenix: true);
    Get.lazyPut(()=> AddLoanAccountController(
      addLoanRepository: Get.find<AddLoanRepository>()
    ), fenix: true);
  }
  
}