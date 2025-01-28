import 'package:agence_mifos/model/saving_account.model.dart';
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

  TextEditingController savingProduct = TextEditingController();

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
    });
    isLoading.value = false;
  }
}