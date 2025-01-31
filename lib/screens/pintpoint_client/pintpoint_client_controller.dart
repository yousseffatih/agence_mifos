import 'package:agence_mifos/model/surveys_client.model.dart';
import 'package:agence_mifos/repository/pintpoint_client/pintpoint_client_repository.dart';
import 'package:agence_mifos/widgets/snak_bar.dart';
import 'package:get/get.dart';

class PintpointClientController extends GetxController{
  final PintpointClientRepository pintpointClientRepository;
  PintpointClientController({ required this.pintpointClientRepository});

  RxBool isLoading = false.obs;
  RxList<SurveysClient> listSurveysClient = <SurveysClient>[].obs;

  @override
  void onInit() async{
    await getAllSurveys();
    super.onInit();
  }

  Future<void> getAllSurveys() async {
    isLoading.value = true;
    final result = await pintpointClientRepository.getAllSurveys();
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (listSurveys){
      listSurveysClient.value = listSurveys;
    });
     isLoading.value = false;
  }
}