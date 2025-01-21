import 'dart:io';

import 'package:agence_mifos/screens/document_loan/document_loan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/action_menu/curtom_show_action_menu.dart';
import '../../widgets/search_button.dart';

class DocumentLoanScreen extends GetView<DocumentLoanController> {
  const DocumentLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showCustomMenu(context,MediaQuery.of(context).size.height * 0.8,[
                  showMenu(controller: controller),
              ]);
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
    return  Obx(()=> Column(
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
      SizedBox(height: 20),
                  
    ],)
    );
  }
}