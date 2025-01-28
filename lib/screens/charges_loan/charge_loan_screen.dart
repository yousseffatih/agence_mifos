import 'package:agence_mifos/global/app_const.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:agence_mifos/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_row_info_center.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custume_date_time_picker.dart';
import '../../widgets/selected_textfield.dart';
import 'charge_loan_controller.dart';

class ChargeLoanScreen extends GetView<ChargeLoanController> {
  const ChargeLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        child: Obx(() {
          if(controller.isLoading.value)
          {
            return LoadingListWidget();
          }
          return ListView.builder(
            itemCount: controller.chargesLoan.length,
            itemBuilder: (context, index) {
              final charge = controller.chargesLoan[index];
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

                      // rowCard(label: 'Client ID ',value: charge['clientId'].toString()),
                      // const SizedBox(height: 8),
                      // rowCard(label: 'Charge Name ',value: charge['chargeName'].toString()),
                      // const SizedBox(height: 8),
                      // rowCard(label: 'Charge Amount',value: "${charge['chargeAmount'].toString()} \$"),
                      // const SizedBox(height: 8),
                      // rowCard(label: 'Charge Due Date',value: charge['chargeDueDate'].toString()),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class rowCard extends StatelessWidget {
  const rowCard({
    super.key,
    required this.value, 
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          "${value}",
          style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}


class showMenu extends StatelessWidget {
  const showMenu({
    super.key,
    required this.controller,
  });

  final ChargeLoanController controller;

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
          SizedBox(height: 50.h,),
          SelectableTextField(
            hint: "Name",
            bgColor: AppColor.grey.withOpacity(0.15),
            options: controller.chargesTemplate.value.chargeOptions!,
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
          SizedBox(width: double.infinity,child: CustomButton(text: "Submit",onPressed: (){
            controller.submitBtn();
          },)),
          SizedBox(height: 100.h),
        ],),
      ),
    ) : Container()
    );
  }
}
