import 'package:agence_mifos/global/app_const.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:agence_mifos/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'repayement_sch_loan_controller.dart';

class RepayementSchLoanScreen extends GetView<RepayementSchLoanController> {
  const RepayementSchLoanScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Repayment Schedule'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if(controller.isLoading.value)
        {
          return LoadingListWidget();
        }
        return Column(
        children: [
          Expanded(
            child: 
                SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                
                child: DataTable(
                  columnSpacing: 20,
                  headingRowColor: MaterialStateProperty.resolveWith<Color?>((states) => AppColor.primaryColor.withOpacity(0.2)),
                  columns: const [
                    DataColumn(label: Text('Status' , style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text('Date' , style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text('Amount Due' , style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text('Amount Paid' , style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                  rows: controller.repayementSch.value.periods!.map((repayment) {
                    return DataRow(cells: [
                      DataCell(
                        Icon(
                          Icons.circle,
                          color: repayment.complete! ? Colors.green : Colors.red,
                        ),
                      ),
                      DataCell(Text(AppConst.dateLabel2(repayment.dueDate))),
                      DataCell(Text('\$${repayment.totalDueForPeriod}')),
                      DataCell(Text('\$${repayment.totalPaidForPeriod}')),
                      
                    ]);
                  }).toList(),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => Text('Complete: ${controller.completeCount}')),
                Obx(() => Text('Pending: ${controller.pendingCount}')),
                Obx(() => Text('Overdue: ${controller.overdueCount}')),
              ],
            ),
          ),
        ],
      );
      },
    ));
  }
}