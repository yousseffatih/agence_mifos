import 'package:agence_mifos/model/loanAccountClient.model.dart';
import 'package:agence_mifos/repository/clients/client_repository.dart';
import 'package:get/get.dart';

import '../../model/client.model.dart';

class ClientController extends GetxController {
  final ClientRepository clientRepository;

  ClientController({required this.clientRepository});
  late int clientId;

  @override
  void onInit() async {
    clientId = Get.arguments;
    await getClientById();
    super.onInit();
  }

  @override
  void onClose() {
    isScreenHiddenLoan.value = false;
    cardTopPosition.value = 0;
    super.onClose();
  }

  final Rx<Client?> client = Rx<Client?>(null);
  final Rx<LoanAccountClient?> loanAcount = Rx<LoanAccountClient?>(null);
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  final isLoanExpanded = false.obs;
  final cardTopPosition = 0.obs;

  var isScreenHiddenLoan = false.obs;
  var isScreenHiddenSaving = false.obs;
  
  void toggleScreenVisibility(bool isLoan) {
  if (isLoan) {
    isScreenHiddenLoan.value = !isScreenHiddenLoan.value;
  } else {
    isScreenHiddenSaving.value = !isScreenHiddenSaving.value;
  }
}


  Future<void> getClientById() async {
    isLoading.value = true;
    final result = await clientRepository.getClientById(clientId);
    result.fold(
      (failure) {
        print('failure Client By ID : $failure');
      },
      (clientData) {
        client.value = clientData;
      },
    );
    await getLoanAccountClient();
    isLoading.value = false;
  }

  Future<void> getLoanAccountClient() async {
    final result = await clientRepository.getLoanAccountForClient(clientId);
    result.fold(
      (failure) {
        print('failure Loan Account for client : $failure');
      },
      (clientData) {
        loanAcount.value = clientData;
      },
    );
  }

  String groupLabel(List<Group>? list) {
  if (list?.isNotEmpty ?? false) {
    return list!.map((e) => e.name).join(', ');
  }
  return "-";
}
}

