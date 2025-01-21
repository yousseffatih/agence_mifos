import 'package:agence_mifos/model/loan_account.model.dart';
import 'package:agence_mifos/repository/transaction_loan/transaction_loan_repository.dart';
import 'package:get/get.dart';


class TrasactionsController extends GetxController{
  final TransactionLoanRepository transactionLoanRepository;
  TrasactionsController({ required this.transactionLoanRepository});

  final RxList<bool> isOpen = <bool>[].obs;
  RxBool loading = false.obs;
  late int idLoan ;
  final transactions = <Transaction>[].obs;
  final loanAccount = LoanAccount().obs;
  

  void toggleExpansion(int index, bool isExpanded) {
    isOpen[index] = isExpanded;
  }

  
  void initializeState(int itemCount) {
    if (isOpen.isEmpty) {
      isOpen.addAll(List.generate(itemCount, (_) => false));
    }
  }
  @override
  void onInit() async{
    idLoan = Get.arguments;
    await getAllTransactionLoan();
    super.onInit();
  }

  Future<void> getAllTransactionLoan() async {
    loading.value = true;
    final result = await transactionLoanRepository.getSearchAll(idLoan);
    result.fold((failure){
      print("Error:${failure.message}");
    },(item){
      loanAccount.value = item;
      transactions.value = loanAccount.value.transactions!;
      initializeState(transactions.length);
    });
    loading.value = false;
  }
}