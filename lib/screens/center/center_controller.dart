import 'package:agence_mifos/model/center_info.model.dart';
import 'package:agence_mifos/model/center_summery_info_center.dart';
import 'package:get/get.dart';

import '../../repository/centers/centers_repository.dart';

class CenterController extends GetxController{
  final CentersRepository centersRepository;
  CenterController({required this.centersRepository});

  late int centerId;
  RxBool isLoading = true.obs;
  final centerInfo = CenterInfo().obs;
  final centerSymmeryInfo = CenterSummeryInfo().obs;

  @override
  void onInit() async{
    print("this is is center :${Get.arguments}");
    centerId = Get.arguments;
    await getCenterInfo();
    super.onInit();
  }

  Future<void> getCenterInfo() async {
    isLoading.value = true;
    final result =  await centersRepository.getDetailInfoCenter(centerId);
    result.fold((failuer){
      print("this center info failuer : $failuer");
    }, (centerDetailInfo){
      centerInfo.value = centerDetailInfo;
    });
    await getCenterSummrey();
    isLoading.value = false;
  }

  Future<void> getCenterSummrey() async {
    final result =  await centersRepository.getDetailSummeryInfoCenter(centerId);
    result.fold((failuer){
      print("this center symmery info failuer : $failuer");
    }, (centerDetailInfo){
      centerSymmeryInfo.value = centerDetailInfo;
    });
  }
}