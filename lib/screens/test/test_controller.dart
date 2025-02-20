import 'package:get/get.dart';

class TestScreenController extends GetxController {
  TestScreenController();
   var clientName = "TestS1".obs;
  var accountBalance = 2687.0.obs;
  var totalDeposits = 2789.0.obs;
  var totalWithdrawals = 100.0.obs;
  var interestEarned = 438.21.obs;

  var transactions = <Map<String, dynamic>>[
    {"date": "10 May 2024", "type": "Withdrawal", "amount": -100.0},
    {"date": "14 Aug 2022", "type": "Deposit", "amount": 200.0},
    {"date": "14 Aug 2022", "type": "Deposit", "amount": 100.0},
    {"date": "14 Aug 2022", "type": "Deposit", "amount": 200.0},
    {"date": "14 Aug 2022", "type": "Deposit", "amount": 500.0},
    {"date": "10 Mar 2021", "type": "Deposit", "amount": 789.0},
    {"date": "1 May 2020", "type": "Pay Charge", "amount": 2.0},
    {"date": "1 May 2020", "type": "Deposit", "amount": 1000.0},
  ].obs;

  void makeDeposit(double amount) {
    accountBalance.value += amount;
    totalDeposits.value += amount;
    transactions.insert(0, {"date": "Today", "type": "Deposit", "amount": amount});
  }

  void withdraw(double amount) {
    if (accountBalance.value >= amount) {
      accountBalance.value -= amount;
      totalWithdrawals.value += amount;
      transactions.insert(0, {"date": "Today", "type": "Withdrawal", "amount": -amount});
    } else {
      Get.snackbar("Error", "Insufficient Balance", snackPosition: SnackPosition.BOTTOM);
    }
  }
}

class GroupModel {
  final String name;
  final String owner;
  final bool isActive;

  GroupModel({required this.name, required this.owner, required this.isActive});
}