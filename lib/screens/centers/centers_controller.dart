import 'package:get/get.dart';

import '../../model/centers.model.dart';
import '../../repository/centers/centers_repository.dart';

class CentersController extends GetxController{
final CentersRepository centersRepository;
CentersController({required this.centersRepository});

final centers = <PageItem>[].obs;
RxBool isloading = false.obs;

  @override
  void onInit() async {
    await getAllCenters();
    super.onInit();
  }

  Future<void> getAllCenters() async {
    isloading.value = true;
    final resluts = await centersRepository.getAllClients();
    resluts.fold((failure){
      print("failuer centers :${failure.message}");
    }, (listClient){
      centers.value = listClient.pageItems!;
    });
    isloading.value = false;
  }
}
