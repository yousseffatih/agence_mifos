import 'package:get/get.dart';

import '../../model/group_list_center.model.dart';
import '../../repository/group_list_center/group_list_center_repository.dart';
import '../../widgets/snak_bar.dart';

class GroupListCenterController extends GetxController {
  final GroupListCenterRepository groupListCenterRepository;
  GroupListCenterController({ required this.groupListCenterRepository});

  late int idCenter;

  Rx<GroupListCenter> groupListCenter = GroupListCenter().obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    idCenter = Get.arguments;
    await getGroupListCenter();
    super.onInit();
  }

  Future<void> getGroupListCenter() async {
    isLoading.value = true;
    final result = await groupListCenterRepository.getGroupList(idCenter);
    result.fold((failure) {
      SnackbarUtils.showError(failure.message);
    }, (data) {
      groupListCenter.value = data;
    });
    isLoading.value = false;
  }
}