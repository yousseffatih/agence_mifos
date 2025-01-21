import 'package:agence_mifos/global/app_const.dart';
import 'package:agence_mifos/screens/transactions_loan/trasactions_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_color.dart';
import '../../widgets/loading_list.dart';

class TransactionsScreen extends GetView<TrasactionsController> {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: const Text('Loan Transactions'),
      ),
      body: Obx(() {
        if(controller.loading.value) {
          return LoadingListWidget();
        }
        return ListView.builder(
        itemCount: controller.transactions.length,
        itemBuilder: (context, index) {
          final transaction = controller.transactions[index];
          return Container(
            margin:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(28.sp),
              
            ),
            child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(  AppConst.dateLabel2(transaction.date), style: const TextStyle(color: AppColor.black)),
                subtitle: Text(transaction.type!.value!, style: const TextStyle(color: Colors.black)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "\$${transaction.amount!.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Obx(()=>Icon(
                        controller.isOpen[index]
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: AppColor.black,
                      ),),
                    
                  ],
                ),
                onExpansionChanged: (isExpanded) {
                    controller.toggleExpansion(index, isExpanded);
                  },
                children: [
                  if (transaction.id != null) ...[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28.sp),bottomRight: Radius.circular(28.sp)), color: AppColor.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Id ",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${transaction.id}",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Office ",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${transaction.officeName}",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 18.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Break Down",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildBreakdownTile("Principal", transaction.principalPortion),
                              buildBreakdownTile("Loan Interest", transaction.interestPortion),
                              buildBreakdownTile("Loan Fees", transaction.feeChargesPortion),
                              buildBreakdownTile("Loan Penalty", transaction.penaltyChargesPortion),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      );
      },
    ),
    );
  }

  Widget buildBreakdownTile(String title, double? value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          value?.toStringAsFixed(2) ?? "0.00",
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}