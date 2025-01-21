import 'package:agence_mifos/screens/document_loan/document_loan_controller.dart';
import 'package:get/get.dart';

class DocumentLoanBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> DocumentLoanController());
  }
  
}