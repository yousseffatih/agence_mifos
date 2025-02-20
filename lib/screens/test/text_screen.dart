import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_controller.dart';

class TestScreen extends GetView<TestScreenController> {
  const TestScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Savings Account Summary"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountInfo(),
            SizedBox(height: 16),
            Text("Transactions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            Expanded(child: _buildTransactionList()),
            SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }
  Widget _buildAccountInfo() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => _infoRow("Client Name", controller.clientName.value)),
            SizedBox(height: 8),
            Obx(() => _infoRow("Account Balance", "\$${controller.accountBalance.value}")),
            Obx(() => _infoRow("Total Deposits", "\$${controller.totalDeposits.value}")),
            Obx(() => _infoRow("Total Withdrawals", "\$${controller.totalWithdrawals.value}")),
            Obx(() => _infoRow("Interest Earned", "\$${controller.interestEarned.value}")),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    return Obx(() => ListView.builder(
          itemCount: controller.transactions.length,
          itemBuilder: (context, index) {
            var transaction = controller.transactions[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(transaction["date"], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(transaction["type"]),
                trailing: Text(
                  "\$${transaction["amount"].abs()}",
                  style: TextStyle(
                    color: transaction["amount"] < 0 ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            controller.withdraw(50.0);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text("Withdrawal", style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.makeDeposit(100.0);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text("Make Deposit", style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}