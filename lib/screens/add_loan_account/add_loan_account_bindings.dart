import 'package:get/get.dart';

import 'add_loan_account_controller.dart';

class AddLoanAccountBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> AddLoanAccountController());
  }
  
}