import 'package:agence_mifos/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_color.dart';
import 'group_list_center_controller.dart';

class GroupListCenterScreen extends GetView<GroupListCenterController> {
  const GroupListCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Groups',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Obx((){
        if(controller.isLoading.value)
        {
          return LoadingListWidget();
        }
        if(controller.groupListCenter.value.groupMembers!.isEmpty)
        {
          return Container();
        }
        return ListView.builder(
            itemCount: controller.groupListCenter.value.groupMembers!.length,
            itemBuilder: (context, index) {
              final group = controller.groupListCenter.value.groupMembers![index];
              return Card(
                color: AppColor.white,
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(group.name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(group.officeName!, style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text("status", style: TextStyle(fontSize: 14)),
                      SizedBox(width: 5),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: group.status!.value =="Active" ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
      }),
    );
  }
}