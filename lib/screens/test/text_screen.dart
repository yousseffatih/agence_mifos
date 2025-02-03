import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_controller.dart';

class TestScreen extends GetView<TestScreenController> {
  const TestScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.groups.length,
            itemBuilder: (context, index) {
              final group = controller.groups[index];
              return Card(
                color: AppColor.white,
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(group.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(group.owner, style: TextStyle(fontSize: 14, color: Colors.grey)),
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
                          color: group.isActive ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}