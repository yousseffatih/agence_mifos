import 'package:agence_mifos/model/body/submit_charges.body.dart';
import 'package:agence_mifos/model/charge_loan.model.dart';
import 'package:agence_mifos/model/loan_account.model.dart';
import 'package:agence_mifos/repository/loan_account/loan_account_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/charge_template.model.dart';

class ChargeLoanController extends GetxController{
  final LoanAccountRepository loanAccountRepository;
  ChargeLoanController({ required this.loanAccountRepository});

  final loanaccount =LoanAccount().obs;
  final chargesLoan = <ChanrgesLoan>[].obs;
  late int idLoan ;
  final isLoading = false.obs;
  final loadSubmit = false.obs;
  final chargesTemplate = ChargesTemplate().obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController localController = TextEditingController();

  final isTrue = true.obs;

  @override
  void onInit() async {
    idLoan = Get.arguments;
    await getChargesLoan();
    await getChargesLoanTemplate();
    super.onInit();
  }

  Future<void> getChargesLoan() async {
    isLoading.value = true;
    final result = await loanAccountRepository.getChargesLoan(idLoan);
    result.fold((failure){
      print("this is the charges loan failure  :${failure.message}");
    }, (listCharges){
      chargesLoan.value = listCharges;
    });
    isLoading.value = false;
  }

  Future<void> getChargesLoanTemplate() async {
    isLoading.value = true;
    final result = await loanAccountRepository.getChargesTemplate(idLoan);
    result.fold((failure){
      print("this is the charges loan failure  2:${failure.message}");
    }, (listCharges){
      chargesTemplate.value = listCharges;
    });
    isLoading.value = false;
  }

  Future<void> submitBtn() async {
    loadSubmit.value = true;
    print("name : ${nameController.text}");
    print("dueDate : ${dateController.text}");
    print('amount : ${amountController.text}');
    SubmitChargesBody submitChargesBody = SubmitChargesBody();
    submitChargesBody.chargeId = int.parse(nameController.text);
    submitChargesBody.dateFormat = "dd MMMM yyyy";
    submitChargesBody.dueDate = dateController.text;
    submitChargesBody.locale = "en";

    loadSubmit.value = false;

    final result = await loanAccountRepository.postSubmitCharges(idLoan , submitChargesBody);

    result.fold((failure){
      Get.snackbar('Error', failure.message);
    }, (u){
      print("this is the success $u");
    });

    loadSubmit.value = false;
  }
}