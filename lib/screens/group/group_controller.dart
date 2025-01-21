import 'package:agence_mifos/model/group_detail.model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../model/loanAccountClient.model.dart';
import '../../repository/groups/groups_repository.dart';

class GroupController extends GetxController {
  final GroupsRepository groupsRepository;
  GroupController({required this.groupsRepository});

  final Rx<GroupDetail?> group = Rx<GroupDetail?>(null);
  final Rx<LoanAccountClient?> loanAcount = Rx<LoanAccountClient?>(null);
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  final isLoanExpanded = false.obs;
  final cardTopPosition = 0.obs;

  var isScreenHiddenLoan = false.obs;
  var isScreenHiddenSaving = false.obs;

  late int groupId ;

  @override
  void onInit() async {
    print("this is group id : ${Get.arguments}");
    groupId = Get.arguments;
    await getDetailGroup();
    super.onInit();
  }

  @override
  void onClose() {
    isScreenHiddenLoan.value = false;
    cardTopPosition.value = 0;
    super.onClose();
  }
  void toggleScreenVisibility(bool isLoan) {
    if (isLoan) {
      isScreenHiddenLoan.value = !isScreenHiddenLoan.value;
    } else {
      isScreenHiddenSaving.value = !isScreenHiddenSaving.value;
    }
  }

  Future<void> getLoanAccountClient() async {
    final result = await groupsRepository.getLoanAccountForGroup(groupId);
    result.fold(
      (failure) {
        print('failure Loan Account for group : $failure');
      },
      (clientData) {
        loanAcount.value = clientData;
      },
    );
  }

  Future<void> getDetailGroup()async {
    isLoading.value = true;
    final result = await groupsRepository.getDetailGroup(groupId);
    result.fold((failure){
      print('this is the group details failure : $failure');
    }, (groupDetail){
      group.value = groupDetail;
    });
    await getLoanAccountClient();
    isLoading.value = false;
  }


}