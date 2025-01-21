import 'package:agence_mifos/data/loan_account/loan_account_provider.dart';
import 'package:agence_mifos/repository/loan_account/loan_account_repository.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import 'loan_account_controller.dart';

class LoanAccountBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);

    Get.lazyPut<LoanAccountProvider>(
      () => LoanAccountProvider(
        apiClient: Get.find<ApiClient>(),
      ),
      fenix: true,
    );

    Get.lazyPut<LoanAccountRepository>(
      () => LoanAccountRepository(
        loanAccountProvider: Get.find<LoanAccountProvider>(),
      ),
      fenix: true,
    );
    
    Get.lazyPut(() => LoanAccountController(loanAccountRepository: Get.find<LoanAccountRepository>()), fenix: true);
  }
  
}