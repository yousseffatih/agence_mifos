import 'package:agence_mifos/repository/groups/groups_repository.dart';
import 'package:get/get.dart';

import '../../model/groups.model.dart';

class GroupsController extends GetxController{
  final GroupsRepository groupsRepository;
  GroupsController({required this.groupsRepository});

  var groups = <PageItem>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async{
    super.onInit();
    await getAllGroups();
  }

  Future<void> getAllGroups() async
  {
    isLoading.value = true;
    final results = await groupsRepository.getallGroups();
    results.fold((failure){
      print("failuer groups :${failure.message}");
    },(group){
      groups.value = group.pageItems!;
    });
    isLoading.value = false;
  }
}