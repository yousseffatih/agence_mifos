import 'dart:io';

import 'package:agence_mifos/screens/document_loan/document_loan_controller.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/search_button.dart';

class DocumentSavingaccountScreen extends GetView<DocumentLoanController> {
  const DocumentSavingaccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Documents'),
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
    );
  }
}

class showMenu extends StatelessWidget {
  const showMenu({
    super.key,
    required this.controller,
  });

  final DocumentLoanController controller;

  @override
  Widget build(BuildContext context) {
    return  Obx(()=> Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, 
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
                "Upload Document",
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
          SizedBox(height: 50.h,),
          CustomTextField(
            controller: controller.nameController,
            hintText: "Name",
            bgColor: AppColor.grey.withOpacity(0.15),
          ),
          SizedBox(height: 30.h,),
          CustomTextField(
            controller: controller.descriptionController,
            hintText: "Description",
            bgColor: AppColor.grey.withOpacity(0.15),
            maxLine: 5,
          ),
          SizedBox(height: 30.h,),
          Row(
            children: [
              controller.selectedFile.value == null
            ? Container(
                height: 150.h,
                width: 800.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Text(
                    'No file selected',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            : Container(
                height: 150.h,
                width: 800.w,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.green),
                ),
                child: Center(
                  child: Text(
                    controller.selectedFile.value!.uri.pathSegments.last,
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(width: 30.w,),
              controller.selectedFile.value == null ?
              SearchButton(
                icon: Icons.file_open,
                onPressed: () async {
                  File? file = await controller.pickFile();
                  if (file != null) {
                      controller.selectedFile.value = file;
                  }
                },
              )
              :
              SearchButton(
                icon: Icons.close,
                onPressed: () async {
                    controller.selectedFile.value = null;
                  }
                
              ),
            ],
          ),
          SizedBox(height: 100.h),
          SizedBox(width: double.infinity,child: CustomButton(text: "Upload",onPressed: (){},)),
          SizedBox(height: 100.h),
        ],),
      ),
    )
    );
  }
}