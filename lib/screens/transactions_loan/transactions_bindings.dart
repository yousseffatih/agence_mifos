import 'package:agence_mifos/data/transaction_loan/transaction_loan_provider.dart';
import 'package:agence_mifos/repository/transaction_loan/transaction_loan_repository.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import 'trasactions_controller.dart';

class TransactionsBindings implements Bindings{
  @override

  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);

    Get.lazyPut<TransactionLoanProvider>(
      () => TransactionLoanProvider(
        apiClient: ApiClient()
      ),
      fenix: true,
    );

    Get.lazyPut<TransactionLoanRepository>(
      () => TransactionLoanRepository(
        transactionLoanProvider: Get.find<TransactionLoanProvider>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => TrasactionsController(transactionLoanRepository: Get.find<TransactionLoanRepository>()),
      fenix: true,
    );
  }
  
  
}