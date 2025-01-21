import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class DocumentLoanController extends GetxController{
  DocumentLoanController();

  final isTrue = true.obs;

  Rx<File?> selectedFile = Rx<File?>(null);

  @override
  void onInit() {
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