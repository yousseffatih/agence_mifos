import 'package:agence_mifos/global/app_const.dart';
import 'package:agence_mifos/model/center_info.model.dart';
import 'package:agence_mifos/model/center_summery_info_center.dart';
import 'package:agence_mifos/widgets/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/centers/centers_repository.dart';

class CenterController extends GetxController{
  final CentersRepository centersRepository;
  CenterController({required this.centersRepository});

  late int centerId;
  RxBool isLoading = false.obs;
  RxBool loadActivate = false.obs;

  final centerInfo = CenterInfo().obs;
  final centerSymmeryInfo = CenterSummeryInfo().obs;

  TextEditingController activatedDateController = TextEditingController();

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

  Future<void> activateCenter() async {
    loadActivate.value = true;
    print(activatedDateController.text);
    final reslut = await centersRepository.activateCenter(centerId, activatedDateController.text);
    reslut.fold((failure){
      SnackbarUtils.showError(failure.message);
    }, (data){
      SnackbarUtils.showError(data.toString());
      activatedDateController.clear();
    });
    loadActivate.value = false;
  }
}