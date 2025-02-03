import 'package:agence_mifos/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pinpoint_client_controller.dart';

class PinpointClientScreen extends GetView<PinpointClientController> {
  const PinpointClientScreen({super.key});

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
      body: Obx((){
        if(controller.isLoading.value)
        {
          return LoadingListWidget();
        }
        return Container();
      }),
    );
  }
}