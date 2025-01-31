import 'package:agence_mifos/model/body/add_identifier.body.dart';
import 'package:agence_mifos/model/identifier_client.model.dart';
import 'package:agence_mifos/repository/identifier_client/identifier_client_repository.dart';
import 'package:agence_mifos/widgets/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/charge_template.model.dart';

class IdentifierClientController extends GetxController {
  final IdentifierClientRepository identifierClientRepository;
  IdentifierClientController({ required this.identifierClientRepository});

  late int idClient;

  RxBool isLoading = false.obs;
  RxBool addLoading =false.obs;
  RxBool deleteLoading =false.obs;
  RxBool isCheckdActive = false.obs;

  final isTrue = true.obs;
  
  RxList<IdentifiersClient> listIdentifierClient = <IdentifiersClient>[].obs;
  RxList<ChargeOption> documentType = <ChargeOption>[].obs;

  TextEditingController documentTypeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController uniqueIdController = TextEditingController();



  @override 
  void onInit() async {
    idClient = Get.arguments;
    await getAllIDentifiersClients();
    super.onInit();
  }

  Future<void> getAllIDentifiersClients () async {
    isLoading.value = true;
    final result = await identifierClientRepository.getidentifiersClient(idClient);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (list) async {
      listIdentifierClient.value = list;
      await getDocumentTypes();
    });
    isLoading.value = false;
  }

  Future<void> getDocumentTypes () async {
    final result = await identifierClientRepository.getDocumentTypes(idClient);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (list){
      documentType.value = list.allowedDocumentTypes!.map<ChargeOption>((e)=> ChargeOption.fromJsonCheck(e.toJson())).toList();
    });
  }

  Future<void> submitBtn() async {
    AddIdentifierBody body = AddIdentifierBody();
    body.status = isCheckdActive.value ? "Active" : "InActive";
    body.documentKey = uniqueIdController.text;
    body.documentTypeId = int.parse(documentTypeController.text);
    body.description = descriptionController.text;
    print("this is body ${body.toJson()}");
    final result = await identifierClientRepository.addIdentifier(idClient, body);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (data)async{
      SnackbarUtils.showSuccess("Identifier added successfully.");
      await getAllIDentifiersClients();
    });
  }

  Future<void> deleteBtn(int id) async {
    deleteLoading.value = true;
    final result = await identifierClientRepository.deleteIdentifier(idClient, id);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (data) async {
      SnackbarUtils.showSuccess(data.toString());
       await getAllIDentifiersClients();
    });
    deleteLoading.value = false;
  }

  void clearForm(){
    documentTypeController.clear();
    uniqueIdController.clear();
    descriptionController.clear();
    isCheckdActive.value = false;
  }
}