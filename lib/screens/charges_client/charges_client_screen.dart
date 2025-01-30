import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global/app_const.dart';
import '../../theme/app_color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_row_info_center.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custume_date_time_picker.dart';
import '../../widgets/loading_list.dart';
import '../../widgets/selected_textfield.dart';
import 'charges_client_controller.dart';

class ChargesClientScreen extends GetView<ChargesClientController> {
  const ChargesClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
        title: Text('Loan Account Summary',style: TextStyle(fontSize: 55.sp),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                builder: (_) => showMenu(controller: controller),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx((){
          if(controller.isLoading.value)
          {
            return LoadingListWidget();
          }
          return ListView.builder(
            itemCount: controller.chargesClient.value.pageItems!.length,
            itemBuilder: (context, index) {
              final charge = controller.chargesClient.value.pageItems![index];
              return Card(
                color: AppColor.white,
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRowInfoCenter(icon: Icons.person,label: 'Client ID ',value: charge.chargeId.toString()),
                      CustomRowInfoCenter(icon: Icons.description,label: 'Charge Name ',value: charge.name!),
                      CustomRowInfoCenter(icon: Icons.attach_money,label: 'Charge Amount',value: "${charge.amount.toString()} \$"),
                      CustomRowInfoCenter(icon: Icons.calendar_today,label: 'Charge Due Date',value: AppConst.dateLabel2(charge.dueDate)),
                    ],
                  ),
                ),
              );
            },
          );;
        }),
      ),
    );
  }
}


class showMenu extends StatelessWidget {
  const showMenu({
    super.key,
    required this.controller,
  });

  final ChargesClientController controller;

  @override
  Widget build(BuildContext context) {
    return  Obx(()=> controller.isTrue.value ?  Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Handles keyboard overlap
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Loan Charge",
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
          
          SizedBox(height: 100.h),
          SelectableTextField(
            hint: "Name",
            bgColor: AppColor.grey.withOpacity(0.15),
            options:  controller.chargeOptions,
            textEditingController: controller.nameController,
          ),
          SizedBox(height: 30.h,),
          CustomTextField(
            controller: controller.amountController,
            keyboardType: TextInputType.number,
            hintText: "Amount",
            bgColor: AppColor.grey.withOpacity(0.15),
          ),
          SizedBox(height: 30.h,),
          CustumeDateTimePicker(
            textEditingController: controller.dateController,
            hint: "Charge due Date",
            bgColor: AppColor.grey.withOpacity(0.15),
          ),
          SizedBox(height: 30.h,),
          CustomTextField(
            controller: controller.localController,
            hintText: "Locale",
            bgColor: AppColor.grey.withOpacity(0.15),
          ),
          SizedBox(height: 100.h),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              load: controller.addLoading.value ,
              text: "Submit",
              onPressed: () async {
                await controller.submitBtn();
                controller.clearForm();
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 100.h),
        ],),
      ),
    ) : Container()
    );
  }
}