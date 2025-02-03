import 'package:get/get.dart';

class TestScreenController extends GetxController {
  TestScreenController();
   var groups = <GroupModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchGroups();
  }

  void fetchGroups() {
    groups.assignAll([
      GroupModel(name: "Prueba", owner: "BEREBIN", isActive: true),
      GroupModel(name: "Team Alpha", owner: "JohnDoe", isActive: false),
      GroupModel(name: "Dev Squad", owner: "JaneSmith", isActive: true),
    ]);
  }
}

class GroupModel {
  final String name;
  final String owner;
  final bool isActive;

  GroupModel({required this.name, required this.owner, required this.isActive});
}