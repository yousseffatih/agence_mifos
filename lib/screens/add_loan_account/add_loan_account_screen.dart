import 'package:agence_mifos/screens/add_loan_account/add_loan_account_controller.dart';
import 'package:agence_mifos/widgets/custom_text_field.dart';
import 'package:agence_mifos/widgets/custume_date_time_picker.dart';
import 'package:agence_mifos/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custum_check_box.dart';
import '../../widgets/selected_textfield.dart';

class AddLoanAccountScreen extends GetView<AddLoanAccountController> {
  const AddLoanAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Application'),
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.isLoading.value)
        {
          return LoadingListWidget();
        }
        return SingleChildScrollView(
        child: Column(
          spacing: 40.sp,
          children: [
            SelectableTextField(
              textEditingController: controller.productLoan,
              hint: "Loan product",
              options: controller.loanProduct.value,
            ),
            SelectableTextField(
              textEditingController: controller.productLoan,
              hint: "Loan purpose",
              options: controller.listloanPurpose.value,
            ),
            SelectableTextField(
              textEditingController: controller.productLoan,
              hint: "Loan office",
              options: controller.listloanloanOffice,
            ),
            SelectableTextField(
              textEditingController: controller.productLoan,
              hint: "Fund",
              options: controller.listloanFund,
            ),
            CustumeDateTimePicker(
              textEditingController: controller.submissionDate, 
              hint: "Submission date"
            ),
            CustumeDateTimePicker(
              textEditingController: controller.disbursedDate, 
              hint: "Disbursed date"
            ),
            CustomTextField(
              controller: controller.extrenalId, 
              hintText: "External Id"
            ),
            SelectableTextField(
              textEditingController: controller.linkSavings,
              hint: "Link Savings",
              options: controller.listLinkSavings,
            ),
            CustomTextField(
              controller: controller.principal, 
              hintText: "Principal"
            ),
            CustomTextField(
              controller: controller.numberOfRepayment, 
              hintText: "Number of Repayments"
            ),
            Row(
              children: [
                  Expanded(
                    child: CustomTextField(
                      controller: controller.normal, 
                      hintText: "Normal"
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  Text("/ Month")
              ]
            ),
            Row(
              children: [
                  Expanded(
                    flex: 6,
                    child: CustomTextField(
                      controller: controller.repaidEvery, 
                      hintText: "Repaid Every"
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  Expanded(
                    flex: 4,
                    child: SelectableTextField(
                      textEditingController: controller.repaidEveryTerm,
                      hint: "Term",
                      options: controller.listTermsWeekTypes,
                    ),
                  )
              ]
            ),
            Row(
              children: [
                  Expanded(
                    flex: 6,
                    child: CustomTextField(
                      controller: controller.loanTerms, 
                      hintText: "Loan Terms"
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  Expanded(
                    flex: 4,
                    child: SelectableTextField(
                      textEditingController: controller.loanTermsTer,
                      hint: "Term",
                      options: controller.listTermsFrequencyTypes,
                    ),
                  )
              ]
            ),
            SelectableTextField(
              textEditingController: controller.amortization,
              hint: "Amortization",
              options: controller.listAmortization,
            ),
            SelectableTextField(
              textEditingController: controller.interestCalPeriod,
              hint: "Interest Caculation Period",
              options: controller.listInterstCalc,
            ),
            SelectableTextField(
              textEditingController: controller.repaymentStra,
              hint: "Repayment strategy",
              options: controller.listRepaymentStra,
            ),
            CustumeCheckBox(
              value : controller.isCheckdCal.value,
              hint:"Calculate Interest for exact days in",
              onChange : (value) => {
                controller.isCheckdCal.value = !controller.isCheckdCal.value 
              }
            ),
            SelectableTextField(
              textEditingController: controller.productLoan,
              hint: "Intrest type method",
              options: controller.listIntersrTypeMeth,
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
      },
    ));
  }
}