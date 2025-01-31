import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/body/submit_charges.body.dart';
import '../../model/charge_client.model.dart';
import '../../model/charge_template.model.dart';
import '../../repository/charges_client/charges_clients_repository.dart';
import '../../widgets/snak_bar.dart';

class ChargesClientController extends GetxController{
  final ChargesClientsRepository chargesClientsRepository;
  ChargesClientController({ required this.chargesClientsRepository});

  
  final chargesTemplate = ChargesTemplate().obs;
  Rx<ChargesClient> chargesClient = ChargesClient().obs;
  RxList<ChargeOption> chargeOptions = <ChargeOption>[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController localController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool addLoading = false.obs;

  final isTrue = true.obs;

  late int idClient;

  @override void onInit() async {
    idClient = Get.arguments;
    await getallChargesClient();
    super.onInit();
  }

  Future<void> getallChargesClient() async 
  {
    isLoading.value = true;
    final result = await chargesClientsRepository.getAllCharges(idClient, 0, 10);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (data) async {
      chargesClient.value = data;
      await getAllChargesOptions();
    });
    isLoading.value = false;
  }

  Future<void> getAllChargesOptions() async 
  {
    final result = await chargesClientsRepository.getAllChargesOptionClient(idClient);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (data){
      chargeOptions.value = data;
    });
  }

  Future<void> submitBtn() async {
    addLoading.value = true;

    final body = SubmitChargesBody();
    body.amount = amountController.text;
    body.chargeId = int.parse(nameController.text);
    body.dateFormat = "dd MMMM yyyy";
    body.dueDate = dateController.text;
    body.locale = "en";

    final result = await chargesClientsRepository.addChargeClient(idClient, body);
    result.fold((failure)
    {
      SnackbarUtils.showError(failure.message);
    }, (data){
      SnackbarUtils.showSuccess(data.toString());
    });

    addLoading.value = false;
  }

  void clearForm(){
    amountController.clear();
    nameController.clear();
    dateController.clear();
    localController.clear();
  }

}