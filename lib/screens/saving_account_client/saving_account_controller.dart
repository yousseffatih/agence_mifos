import 'package:agence_mifos/repository/saving_account_client/saving_account_repository.dart';
import 'package:agence_mifos/widgets/snak_bar.dart';
import 'package:get/get.dart';

import '../../model/saving_account_client.model.dart';

class SavingAccountController extends GetxController {
  final SavingAccountRepository savingAccountRepository;
  SavingAccountController({ required this.savingAccountRepository});

  Rx<SavingAccountClient> savingAccountClient = SavingAccountClient().obs;

  final isLoding = false.obs;
  late int idSavingAccount;

  @override
  void onInit() async{
    idSavingAccount = Get.arguments;
    await getSavingAccount();
    super.onInit();
  }

  Future<void> getSavingAccount() async {
    isLoding.value = true;
    final result = await savingAccountRepository.getSearchAll(idSavingAccount);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (data) {
      SnackbarUtils.showSuccess(data.toString());
    });
    isLoding.value = false;
  }
}