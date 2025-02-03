import 'package:agence_mifos/repository/pinpoint_client/pinpoint_client_repository.dart';
import 'package:agence_mifos/widgets/snak_bar.dart';
import 'package:get/get.dart';

class PinpointClientController extends GetxController{
  final PinpointClientRepository pinpointClientRepository;
  PinpointClientController({ required this.pinpointClientRepository});

  late int idClient;

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    idClient = Get.arguments;
    await getAllpinpointClient();
    super.onInit();
  }


  Future<void> getAllpinpointClient()async 
  {
    isLoading.value = true;
    final result = await pinpointClientRepository.getPinPointClient(idClient);
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (data){
      SnackbarUtils.showSuccess(data.toString());
    });
    isLoading.value = false;
  }
}