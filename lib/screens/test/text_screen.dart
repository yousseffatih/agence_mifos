import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'test_controller.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});




  @override
  Widget build(BuildContext context) {
    final TestScreenController controller = Get.put(TestScreenController());

    final transactions = [
      LoanTransaction(
        date: "1 May 2020",
        type: "Repayment (at time of disbursement)",
        amount: 2000.0,
        breakdownId: "10 BankHive",
        principal: 0.0,
        interest: 0.0,
        fees: 2000.0,
        penalty: 0.0,
      ),
      LoanTransaction(
        date: "15 June 2020",
        type: "Repayment",
        amount: 1500.0,
        breakdownId: "11 BankHive",
        principal: 1000.0,
        interest: 300.0,
        fees: 200.0,
        penalty: 0.0,
      ),
      // Add more transactions as needed
    ];

    controller.initializeState(transactions.length);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: const Text('Loan Transactions'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Container(
            margin:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(28.sp),
              
            ),
            child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(transaction.date, style: const TextStyle(color: AppColor.black)),
                subtitle: Text(transaction.type, style: const TextStyle(color: Colors.black)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "\$${transaction.amount.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                        controller.isOpen[index]
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: Colors.white,
                      ),
                  ],
                ),
                onExpansionChanged: (isExpanded) {
                    controller.toggleExpansion(index, isExpanded);
                  },
                children: [
                  if (transaction.breakdownId != null) ...[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28.sp),bottomRight: Radius.circular(28.sp)), color: AppColor.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Id Office: ${transaction.breakdownId}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Breakdown",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildBreakdownTile("Principal", transaction.principal),
                              buildBreakdownTile("Loan Interest", transaction.interest),
                              buildBreakdownTile("Loan Fees", transaction.fees),
                              buildBreakdownTile("Loan Penalty", transaction.penalty),
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
      ),
    )
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

class LoanTransaction {
  final String date;
  final String type;
  final double amount;
  final String? breakdownId;
  final double? principal;
  final double? interest;
  final double? fees;
  final double? penalty;

  LoanTransaction({
    required this.date,
    required this.type,
    required this.amount,
    this.breakdownId,
    this.principal,
    this.interest,
    this.fees,
    this.penalty,
  });
}