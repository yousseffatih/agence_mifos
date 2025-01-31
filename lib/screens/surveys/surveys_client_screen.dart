import 'package:agence_mifos/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_color.dart';
import 'pintpoint_client_controller.dart';

class SurveysClientScreen extends GetView<SurveysClientController> {
  const SurveysClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pinpoint Client"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.local_activity),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select one survey',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () {
                  if(controller.isLoading.value)
                  {
                    return LoadingListWidget();
                  }
                  return ListView.builder(
                  itemCount: controller.listSurveysClient.length,
                  itemBuilder: (context, index) {
                    final survey = controller.listSurveysClient[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border(
                          top: BorderSide(color: AppColor.primaryColor, width: 10.w),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(survey.name!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(survey.description!, style: TextStyle(color: Colors.grey[700])),
                        onTap: () {
                          Get.snackbar('Survey Selected', survey.name!,
                              snackPosition: SnackPosition.BOTTOM);
                        },
                      ),
                    );
                  },
                );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}