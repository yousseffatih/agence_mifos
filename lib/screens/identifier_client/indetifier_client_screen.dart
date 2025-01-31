import 'package:agence_mifos/route/routes.dart';
import 'package:agence_mifos/widgets/loading_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../model/identifier_client.model.dart';
import '../../theme/app_color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custum_check_box.dart';
import '../../widgets/custume_date_time_picker.dart';
import '../../widgets/loading_list.dart';
import '../../widgets/selected_textfield.dart';
import 'identifier_client_controller.dart';

class IdnetifierClientScreen extends GetView<IdentifierClientController> {
  const IdnetifierClientScreen({super.key});

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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                builder: (_) => showMenu(controller: controller),
              );
            },
          ),
        ],
      ),
      body: Obx(() 
      {
        if(controller.isLoading.value)
        {
          return LoadingListWidget();
        }
        return ListView.builder(
            itemCount: controller.listIdentifierClient.length,
            itemBuilder: (context, index) {
              final identifier = controller.listIdentifierClient[index];
              return IdentifierCard(identifier: identifier);
            },
          );
        },
      )
    );
  }
}





class IdentifierCard extends GetView<IdentifierClientController> {
  final IdentifiersClient identifier;

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
                      "Type: ${identifier.documentType!.name}",
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
                      onTap: (){
                        Get.toNamed(AppRoute.document, arguments: controller.idClient);
                      },
                    ),
                    PopupMenuItem(
                      value: "delete",
                      child: ListTile(
                        leading: controller.deleteLoading.value ?
                        LoadingCircle(width: 150.w, height: 150.h, color: AppColor.red)
                        :Icon(Icons.delete, color: AppColor.red),
                        title: Text("Remove"),
                      ),
                      onTap: () async {
                        controller.deleteBtn(identifier.id!);
                      },
                    ),
                  ],
                  icon: Icon(Icons.more_vert, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Description Section
            Text(
              identifier.description!,
              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

class showMenu extends StatelessWidget {
  const showMenu({
    super.key,
    required this.controller,
  });

  final IdentifierClientController controller;

  @override
  Widget build(BuildContext context) {
    return  Obx(()=> controller.isTrue.value ?  Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Handles keyboard overlap
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Loan Charge",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          
          SizedBox(height: 100.h),
          SelectableTextField(
            hint: "Document Type",
            bgColor: AppColor.grey.withOpacity(0.15),
            options:  controller.documentType,
            textEditingController: controller.documentTypeController,
          ),
          SizedBox(height: 30.h,),
          CustomTextField(
            controller: controller.uniqueIdController,
            hintText: "Unique Id",
            bgColor: AppColor.grey.withOpacity(0.15),
          ),
          SizedBox(height: 30.h,),
          CustomTextField(
            controller: controller.descriptionController,
            hintText: "Description",
            bgColor: AppColor.grey.withOpacity(0.15),
            maxLine: 5,
          ),
          CustumeCheckBox(
              value : controller.isCheckdActive.value,
              hint:"Active",
              onChange : (value) => {
                controller.isCheckdActive.value = !controller.isCheckdActive.value 
              }
            ),
          SizedBox(height: 50.h),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              load: controller.addLoading.value ,
              text: "Submit",
              onPressed: () async {
                await controller.submitBtn();
                controller.clearForm();
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 100.h),
        ],),
      ),
    ) : Container()
    );
  }
}