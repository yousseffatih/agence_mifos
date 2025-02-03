import 'package:agence_mifos/screens/document_loan/document_loan_controller.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import '../../data/loan_account/loan_account_provider.dart';
import '../../repository/loan_account/loan_account_repository.dart';

class DocumentSavingaccountBindings implements Bindings{
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
    
    Get.lazyPut(()=> DocumentLoanController());
  }
  
}