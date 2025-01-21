import 'package:agence_mifos/data/repayement_sch_loan/repayement_sch_loan_provider.dart';
import 'package:get/get.dart';

import '../../data/api_client.dart';
import '../../repository/repayement_sch_loan/repayement_sch_loan_repository.dart';
import 'repayement_sch_loan_controller.dart';

class RepaymentSchLoanBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);

    Get.lazyPut<RepayementSchLoanProvider>(
      () => RepayementSchLoanProvider(
        apiClient: Get.find<ApiClient>(),
      ),
      fenix: true,
    );

    Get.lazyPut<RepayementSchLoanRepository>(
      () => RepayementSchLoanRepository(
        repayementSchLoanProvider: Get.find<RepayementSchLoanProvider>(),
      ),
      fenix: true,
    );
    Get.lazyPut(()=> RepayementSchLoanController(repository: Get.find<RepayementSchLoanRepository>()));
  }
  
}