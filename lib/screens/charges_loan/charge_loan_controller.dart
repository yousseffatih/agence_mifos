import 'package:agence_mifos/model/charge_loan.model.dart';
import 'package:agence_mifos/model/loan_account.model.dart';
import 'package:agence_mifos/repository/loan_account/loan_account_repository.dart';
import 'package:get/get.dart';

class ChargeLoanController extends GetxController{
  final LoanAccountRepository loanAccountRepository;
  ChargeLoanController({ required this.loanAccountRepository});

  final loanaccount =LoanAccount().obs;
  final chargesLoan = <ChanrgesLoan>[].obs;
  late int idLoan ;
  final isLoading = false.obs;

  final charges = [
    {
      "clientId": 1,
      "chargeName": "Test 1",
      "chargeAmount": 2000.0,
      "chargeDueDate": "No Due Date",
    },
    {
      "clientId": 4,
      "chargeName": "Penalty Fee",
      "chargeAmount": 20.0,
      "chargeDueDate": "2020-6-1",
    },
    {
      "clientId": 4,
      "chargeName": "Penalty Fee",
      "chargeAmount": 20.0,
      "chargeDueDate": "2020-7-1",
    },
  ].obs;

  @override
  void onInit() async {
    idLoan = Get.arguments;
    await getChargesLoan();
    super.onInit();
  }

  Future<void> getChargesLoan() async {
    isLoading.value = true;
    final result = await loanAccountRepository.getChargesLoan(idLoan);
    result.fold((failure){
      print("this is the error :${failure.message}");
    }, (listCharges){
      chargesLoan.value = listCharges;
      
    });
    isLoading.value = false;
  }
}