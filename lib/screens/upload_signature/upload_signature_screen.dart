import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import 'upload_signature_controller.dart';

class UploadSignatureScreen extends GetView<UploadSignatureController> {
  const UploadSignatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signature', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.upload),
            onPressed: () {}, // Implement upload logic
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Signature(
                  controller: controller.signaturePad,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    backgroundColor: Colors.purple.shade50,
                  ),
                  icon: Icon(Icons.close, color: Colors.black),
                  label: Text("Reset", style: TextStyle(color: Colors.black)),
                  onPressed: controller.clearSignature,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  icon: Icon(Icons.image),
                  label: Text("Gallery"),
                  onPressed: () async {
                    File? file = await controller.pickFile();
                  if (file != null) {
                      controller.selectedFile.value = file;
                  }
                  }, // Implement gallery logic
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}