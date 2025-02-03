import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentSavingaccountController extends GetxController{
  DocumentSavingaccountController();

  final isTrue = true.obs;

  late int idSavingAccount;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<File?> selectedFile = Rx<File?>(null);

  @override
  void onInit() {
    idSavingAccount = Get.arguments;
    super.onInit();
  }

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  
}