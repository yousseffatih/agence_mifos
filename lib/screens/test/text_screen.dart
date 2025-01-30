import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'test_controller.dart';

class TestScreen extends GetView<TestScreenController> {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Identifiers"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.identifiers.length,
          itemBuilder: (context, index) {
            final identifier = controller.identifiers[index];
            return IdentifierCard(identifier: identifier);
          },
        ),
      ),
    );
  }
}

class IdentifierCard extends StatelessWidget {
  final Identifier identifier;

  IdentifierCard({required this.identifier});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
          border: Border(left: BorderSide(color: Colors.green, width: 8)), // Green left border
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ID and Type Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Id: ${identifier.id}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Type: ${identifier.type}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54),
                    ),
                  ],
                ),
                
                // Popup Menu with Modern Icons
                PopupMenuButton<String>(
                  onSelected: (value) {
                    // Handle actions here
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: "edit",
                      child: ListTile(
                        leading: Icon(Icons.file_copy, color: AppColor.primaryColor),
                        title: Text("Documents"),
                      ),
                    ),
                    PopupMenuItem(
                      value: "delete",
                      child: ListTile(
                        leading: Icon(Icons.delete, color: AppColor.red),
                        title: Text("Remove"),
                      ),
                    ),
                  ],
                  icon: Icon(Icons.more_vert, color: Colors.black54),
                ),
              ],
            ),

            SizedBox(height: 8),

            // Description Section
            Text(
              identifier.description,
              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
