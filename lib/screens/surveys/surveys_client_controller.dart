import 'package:agence_mifos/model/surveys_client.model.dart';
import 'package:agence_mifos/widgets/snak_bar.dart';
import 'package:get/get.dart';

import '../../repository/surveys/pintpoint_client_repository.dart';

class SurveysClientController extends GetxController{
  final SurveysClientRepository surveysClientRepository;
  SurveysClientController({ required this.surveysClientRepository});

  RxBool isLoading = false.obs;
  RxList<SurveysClient> listSurveysClient = <SurveysClient>[].obs;

  @override
  void onInit() async{
    await getAllSurveys();
    super.onInit();
  }

  Future<void> getAllSurveys() async {
    isLoading.value = true;
    final result = await surveysClientRepository.getAllSurveys();
    result.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (listSurveys){
      listSurveysClient.value = listSurveys;
    });
     isLoading.value = false;
  }
}