import 'package:agence_mifos/model/loan_account.model.dart';
import 'package:agence_mifos/repository/repayement_sch_loan/repayement_sch_loan_repository.dart';
import 'package:get/get.dart';

class RepayementSchLoanController extends GetxController{
  final RepayementSchLoanRepository repository;
  RepayementSchLoanController({required this.repository});

  final loanAccount = LoanAccount().obs;
  final isLoading = false.obs;
  final repayementSch = RepaymentSchedule().obs;
  late int idLoan;

  final repayments = <Map<String, dynamic>>[
    {'status': true, 'date': '1 Jun 2020', 'amountDue': 9020.0, 'amountPaid': 9020.0},
    {'status': true, 'date': '1 Jul 2020', 'amountDue': 9020.0, 'amountPaid': 9020.0},
    {'status': true, 'date': '1 Aug 2020', 'amountDue': 21960.0, 'amountPaid': 21960.0},
    {'status': false, 'date': '1 Sep 2020', 'amountDue': 9000.0, 'amountPaid': 0.0},
    {'status': false, 'date': '1 Oct 2020', 'amountDue': 9000.0, 'amountPaid': 0.0},
    {'status': false, 'date': '1 Nov 2020', 'amountDue': 9000.0, 'amountPaid': 0.0},
    {'status': false, 'date': '1 Dec 2020', 'amountDue': 9000.0, 'amountPaid': 0.0},
    {'status': false, 'date': '1 Jan 2021', 'amountDue': 9000.0, 'amountPaid': 0.0},
    {'status': false, 'date': '1 Feb 2021', 'amountDue': 9000.0, 'amountPaid': 0.0},
    {'status': false, 'date': '1 Mar 2021', 'amountDue': 9000.0, 'amountPaid': 0.0},
    {'status': false, 'date': '1 Apr 2021', 'amountDue': 4225.18, 'amountPaid': 0.0},
  ].obs;


  int get completeCount => repayementSch.value.periods!.where((e) => e.complete == true).length;
  int get pendingCount =>repayementSch.value.periods!.where((e) => e.complete == false).length;
  int get overdueCount => pendingCount; // Assuming overdue == pending for now

  

  @override
  void onInit() async {
    idLoan = Get.arguments;
    await getRepayementSch();
    super.onInit();
  }

  Future<void> getRepayementSch() async {
    isLoading.value = true;
    final result = await repository.getSearchAll(idLoan);
    result.fold((failure){
      print('this is the repayment error : $failure');
    }, (loa){
      loanAccount.value = loa;
      repayementSch.value = loanAccount.value.repaymentSchedule!;
    });
    isLoading.value = false;
  }
}