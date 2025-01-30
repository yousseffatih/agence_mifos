import 'dart:io';

import 'package:agence_mifos/repository/document_client/document_client_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentClientController extends GetxController{
  final DocumentClientRepository documentClientRepository;
  DocumentClientController({ required this.documentClientRepository});

  final isTrue = true.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Rx<File?> selectedFile = Rx<File?>(null);

  late int idClient;

  @override
  void onInit() {
    idClient = Get.arguments;
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