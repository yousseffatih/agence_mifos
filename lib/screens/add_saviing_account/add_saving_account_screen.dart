import 'package:agence_mifos/screens/add_saviing_account/add_saving_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/loading_list.dart';
import '../../widgets/selected_textfield.dart';

class AddSavingAccountScreen extends GetView<AddSavingAccountController> {
  const AddSavingAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Savings Account'),
        centerTitle: true,
      ),
      body: Obx((){
        if(controller.isLoading.value)
        {
          return LoadingListWidget();
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              SelectableTextField(
                textEditingController: controller.savingProduct,
                hint: "Loan product",
                options: controller.listSaveProduct,
              ),
            ],
          ).paddingAll(35.sp),
        );
      }),
    );
  }
}