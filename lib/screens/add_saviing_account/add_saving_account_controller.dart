import 'package:agence_mifos/model/body/add_saving_account.body.dart';
import 'package:agence_mifos/model/saving_account.model.dart';
import 'package:agence_mifos/model/saving_prod_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/charge_template.model.dart';
import '../../repository/loan_account/add_saving_account_reppository.dart';
import '../../widgets/snak_bar.dart';

class AddSavingAccountController extends GetxController{
  final AddSavingAccountReppository accountReppository;
  AddSavingAccountController({required this.accountReppository });

  late int idCLient ;

  RxBool isLoading = false.obs;
  RxList<ChargeOption> listSaveProduct = <ChargeOption>[].obs;
  RxList<SavingsProduct> savingProducts = <SavingsProduct>[].obs;
  Rx<SavingProdTemplate> savingProdTemplate = SavingProdTemplate().obs;

  TextEditingController savingProduct = TextEditingController();
  TextEditingController extrenalId = TextEditingController();
  TextEditingController submissionDate = TextEditingController();
  TextEditingController nominalAnnualInt = TextEditingController();
  TextEditingController interstCalculatedUsing = TextEditingController();
  TextEditingController interstCompoundingPeriod = TextEditingController(text:"Daily");
  TextEditingController interstPostingPeriod = TextEditingController(text:"Monthly");
  TextEditingController daysInYear = TextEditingController(text:"365 Days");
  TextEditingController enforceMinReqBal = TextEditingController();
  TextEditingController maxOversraftAmount = TextEditingController();
  TextEditingController nominalAnnInt = TextEditingController();
  TextEditingController minOverdraftInt = TextEditingController();

  RxBool isCheckdEnforceMRB = false.obs;
  RxBool isCheckdOverdravtAllowd = false.obs;
  RxBool isAddLoading = false.obs;



  @override
  void onInit() async {
    idCLient = Get.arguments;
    await getListLoanProduct();
    super.onInit();
  }

  Future<void> getListLoanProduct() async 
  {
    isLoading.value = true;
    final result = await accountReppository.getLoanProduct();
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (list) async {
      savingProducts.value = list;
      listSaveProduct.value = list.map<ChargeOption>((e) => ChargeOption.fromJsonCheck(e.toJson())).toList();
      await getListLoanProductTemplate();
    });
    isLoading.value = false;
  }
  Future<void> getListLoanProductTemplate() async 
  {
    final result = await accountReppository.getLoanProductTemplate();
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (data) async {
      savingProdTemplate.value = data;
    });
  }

  Future<void> addSavingAccount() async {
    isAddLoading.value = true;
    AddSavingAccounBody body = AddSavingAccounBody();
    body.allowOverdraft = false;
    body.clientId = idCLient;
    body.dateFormat = "ss MMMM yyyy";
    body.enforceMinRequiredBalance = false;
    body.externalId = "";
    body.fieldOfficerId = 0;
    body.minOverdraftForInterestCalculation ="";
    body.nominalAnnualInterestRate = "";
    body.nominalAnnualInterestRateOverdraft = "";
    body.overdraftLimit = "";
    body.productId = 0;
    body.submittedOnDate = "29 January 2025";
    final result = await accountReppository.addSavingAccount(body);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (data){
      SnackbarUtils.showSuccess(data.toString());
    });
    isAddLoading.value = true;
  }
}