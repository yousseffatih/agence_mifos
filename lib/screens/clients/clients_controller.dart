import 'package:agence_mifos/repository/clients/client_repository.dart';
import 'package:get/get.dart';

import '../../model/clients.model.dart';


class ClientsController extends GetxController{
  final ClientRepository clientRepository;
  ClientsController({required this.clientRepository});


  RxList<PageItem> client = <PageItem>[].obs;
  RxBool isloadng = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllClients();
  }

  Future<void> getAllClients() async {
    isloadng.value = true;
    final resluts = await clientRepository.getAllClients();
    resluts.fold((failure){
      print("failuer client :${failure.message}");
    }, (listClient){
      client.value = listClient.pageItems!;
    });
    isloadng.value = false;
  }
}