import 'package:agence_mifos/model/loan_account.model.dart';
import 'package:agence_mifos/repository/loan_account/loan_account_repository.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanAccountController extends GetxController{
  final LoanAccountRepository loanAccountRepository;
  LoanAccountController({ required this.loanAccountRepository});

  LoanAccount loanAccount = LoanAccount();
  final isLoding = false.obs;
  late int loanAccoundId ;

  @override
  void onInit() async {
    print("this is is Loan Account ===> ${Get.arguments}");
    loanAccoundId = Get.arguments;
    await getLoanAccountByID();
    super.onInit();
  }

  Future<void> getLoanAccountByID() async {
    isLoding.value = true;
    final result = await loanAccountRepository.getLoanAccountById(loanAccoundId);
    result.fold((failure){
      print("this is the failuer loan Account : ${failure.message}");
    }, (loanAcc) {
      loanAccount = loanAcc;
    });
    isLoding.value = false;
  }

  String getLabel(Color color) {
    switch(color) {
      case AppColor.black:
      return "Loan closed";

      case AppColor.primaryColor:
      return "Disburse loan";

      case AppColor.green:
      return "Make Repayement";

      case AppColor.teal:
      return "Approve loan";

      default : 
      return "...";
    }
  }

}