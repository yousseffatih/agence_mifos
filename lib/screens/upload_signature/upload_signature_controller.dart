import 'dart:io';

import 'package:agence_mifos/repository/upload_signature/upload_signature_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';


class UploadSignatureController extends GetxController{
  final UploadSignatureRepository uploadSignatureRepository;
  UploadSignatureController({ required this.uploadSignatureRepository});

  final SignatureController signaturePad = SignatureController();
  Rx<File?> selectedFile = Rx<File?>(null);


  void clearSignature() {
    signaturePad.clear();
  }

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
    return null;
  }
}