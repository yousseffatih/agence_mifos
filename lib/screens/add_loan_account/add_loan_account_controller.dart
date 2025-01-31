import 'package:agence_mifos/model/body/add_Loan.body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/add_loan_list.dart';
import '../../model/charge_template.model.dart';
import '../../repository/loan_account/add_loan_repository.dart';
import '../../widgets/snak_bar.dart';

class AddLoanAccountController extends GetxController{

  final AddLoanRepository addLoanRepository;
  AddLoanAccountController({ required this.addLoanRepository});

  TextEditingController productLoan = TextEditingController();
  TextEditingController purposLoan = TextEditingController();
  TextEditingController officeLoan = TextEditingController();
  TextEditingController fund = TextEditingController();
  TextEditingController submissionDate = TextEditingController();
  TextEditingController disbursedDate = TextEditingController();
  TextEditingController extrenalId = TextEditingController();
  TextEditingController linkSavings = TextEditingController();
  TextEditingController principal = TextEditingController();
  TextEditingController numberOfRepayment = TextEditingController();
  TextEditingController normal = TextEditingController();
  TextEditingController repaidEvery = TextEditingController();
  TextEditingController loanTerms = TextEditingController();
  TextEditingController amortization = TextEditingController();
  TextEditingController interestCalPeriod = TextEditingController();
  TextEditingController repaymentStra = TextEditingController();
  TextEditingController checkCal = TextEditingController();
  TextEditingController intrestTypeMeth = TextEditingController();
  TextEditingController repaidEveryTerm = TextEditingController();
  TextEditingController loanTermsTer = TextEditingController();
  RxBool isCheckdCal = false.obs;

  RxBool isLoading = false.obs;
  RxBool loadingSubmit = false.obs;
  
  RxList<ChargeOption> loanProduct = <ChargeOption>[].obs;
  RxList<ChargeOption> listloanPurpose = <ChargeOption>[].obs;
  RxList<ChargeOption> listloanloanOffice = <ChargeOption>[].obs;
  RxList<ChargeOption> listloanFund = <ChargeOption>[].obs;
  RxList<ChargeOption> listLinkSavings = <ChargeOption>[].obs;
  RxList<ChargeOption> listAmortization = <ChargeOption>[].obs;
  RxList<ChargeOption> listInterstCalc = <ChargeOption>[].obs;
  RxList<ChargeOption> listRepaymentStra = <ChargeOption>[].obs;
  RxList<ChargeOption> listIntersrTypeMeth = <ChargeOption>[].obs;

  RxList<ChargeOption> listTermsWeekTypes = <ChargeOption>[].obs;
  RxList<ChargeOption> listTermsFrequencyTypes = <ChargeOption>[].obs;

  Rx<LoanList> loanList = LoanList().obs;

  late int idClient;

  @override void onInit() async{
    idClient = Get.arguments;
    await getListLoanProduct();
    super.onInit();
  }

  Future<void> getListLoanProduct() async 
  {
    isLoading.value = true;
    final result = await addLoanRepository.getLoanProduct();
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (list) async {
      loanProduct.value = list;
      await getListsLoan();
    });
    isLoading.value = false;
  }

  Future<void> getListsLoan() async 
  {
    final result = await addLoanRepository.getListAddLoan(idClient);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (listsLoan){
      loanList.value = listsLoan;
      listloanPurpose.value  = listsLoan.loanPurposeOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheck(e.toJson())).toList();
      listloanloanOffice.value  = listsLoan.loanOfficerOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheckDiplayName(e.toJson())).toList();
      listloanFund.value  = listsLoan.fundOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheck(e.toJson())).toList();
      listLinkSavings.value = listsLoan.accountLinkingOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheckProdactName(e.toJson())).toList();
      listAmortization.value = listsLoan.amortizationTypeOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheckValue(e.toJson())).toList();
      listInterstCalc.value = listsLoan.interestCalculationPeriodTypeOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheckValue(e.toJson())).toList();
      listRepaymentStra.value = listsLoan.transactionProcessingStrategyOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheck(e.toJson())).toList();
      listIntersrTypeMeth.value = listsLoan.interestTypeOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheckValue(e.toJson())).toList();      
      listTermsWeekTypes.value = listsLoan.repaymentFrequencyDaysOfWeekTypeOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheckValue(e.toJson())).toList();
      listTermsFrequencyTypes.value = listsLoan.termFrequencyTypeOptions!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheckValue(e.toJson())).toList();
    });
  }
  Future<void> addLoanDynamic() async {
      loadingSubmit.value = true;
      AddLoanBody body = AddLoanBody();
      body.amortizationType = int.parse(amortization.text);
      body.allowPartialPeriodInterestCalcualtion = false;
      body.clientId = 1;
      body.dateFormat = "dd MMMM yyyy";
      body.expectedDisbursementDate = "28 january 2025";
      body.fundId = 0;
      body.interestCalculationPeriodType=0;
      body.interestRatePerPeriod = 0;
      body.interestType= int.parse(intrestTypeMeth.text);
      body.linkAccountId= 0;
      body.loanOfficerId= 0;
      body.loanPurposeId= 5;
      body.loanTermFrequency= 20;
      body.loanTermFrequencyType= 0;
      body.loanType= "individual";
      body.locale= "en";
      body.numberOfRepayments= 10;
      body.principal= 10000.0;
      body.productId= 89;
      body.repaymentEvery= 2;
      body.repaymentFrequencyDayOfWeekType= 0;
      body.repaymentFrequencyNthDayType= 0;
      body.repaymentFrequencyType= 0;
      body.submittedOnDate= submissionDate.text;
      body.transactionProcessingStrategyId= 0;

      final result = await addLoanRepository.addLoan(body);
      result.fold((failure){
        SnackbarUtils.showError(failure.message);
      }, (rightResult){
        SnackbarUtils.showSuccess(rightResult.toString());
      });
      loadingSubmit.value = false;
    }
}