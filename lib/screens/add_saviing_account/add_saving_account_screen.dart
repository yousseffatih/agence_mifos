import 'package:agence_mifos/screens/add_saviing_account/add_saving_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custum_check_box.dart';
import '../../widgets/custume_date_time_picker.dart';
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
            spacing: 40.sp,
            children: [
              SelectableTextField(
                textEditingController: controller.savingProduct,
                hint: "Loan product",
                options: controller.listSaveProduct,
              ),
              SelectableTextField(
                textEditingController: controller.savingProduct,
                hint: "Field Office",
                options: controller.listSaveProduct,
              ),
              CustomTextField(
                controller: controller.extrenalId, 
                hintText: "External Id"
              ),
              CustumeDateTimePicker(
                textEditingController: controller.submissionDate, 
                hint: "Submission date"
              ),
              CustomTextField(
                controller: controller.nominalAnnualInt, 
                hintText: "Nominal annual interest",
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                controller: controller.interstCalculatedUsing, 
                hintText: "Interst calculated using",
              ),
              CustomTextField(
                controller: controller.interstCompoundingPeriod, 
                hintText: "Interst Compounding period",
                readOnly: true,
              ),
              CustomTextField(
                controller: controller.interstPostingPeriod, 
                hintText: "Interst posting period",
                readOnly: true,
              ),
              CustomTextField(
                controller: controller.daysInYear, 
                hintText: "Days in year",
                readOnly: true,
              ),
              CustumeCheckBox(
                value : controller.isCheckdEnforceMRB.value,
                hint:"Enforce Minimum Required Balance",
                onChange : (value) => {
                  controller.isCheckdEnforceMRB.value = !controller.isCheckdEnforceMRB.value 
                }
              ),
              if(controller.isCheckdEnforceMRB.value)
              CustomTextField(
                controller: controller.enforceMinReqBal, 
                hintText: "Enforce Minimum Required Balance",
              ),
              CustumeCheckBox(
                value : controller.isCheckdOverdravtAllowd.value,
                hint:"Overdraft Allowed",
                onChange : (value) => {
                  controller.isCheckdOverdravtAllowd.value = !controller.isCheckdOverdravtAllowd.value 
                }
              ),
              if(controller.isCheckdOverdravtAllowd.value)
              Column(
                spacing: 40.sp,
                children: [
                  CustomTextField(
                    controller: controller.maxOversraftAmount, 
                    hintText: "Maximum overdraft amount",
                  ),
                  CustomTextField(
                    controller: controller.nominalAnnInt, 
                    hintText: "Nominal annual interest for overdraft",
                  ),
                  CustomTextField(
                    controller: controller.minOverdraftInt, 
                    hintText: "Minimum Overdraft for interest Caculation",
                  ),
                  
                ],
              ),
              SizedBox(
              width: double.infinity.w,
              child: CustomButton(
                load: false,
                onPressed: (){},
                text: "Submit",
              ),
            ),
            ],
          ).paddingAll(40.sp),
        );
      }),
    );
  }
}