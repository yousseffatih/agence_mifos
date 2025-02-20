import 'package:agence_mifos/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global/app_const.dart';
import '../../route/routes.dart';
import '../../theme/app_color.dart';
import '../../widgets/action_menu/build_menu_option.dart';
import '../../widgets/action_menu/curtom_show_action_menu.dart';
import '../../widgets/loading_list.dart';
import '../../widgets/loan_accoun_Item_info.dart';
import 'saving_account_controller.dart';

class SavingAccountScreen extends GetView<SavingAccountController> {
  const SavingAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("Savings Account Summary", style: TextStyle(fontSize: 50.sp),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              showCustomMenu(context,MediaQuery.of(context).size.height * 0.8,[
                buildMenuOption(icon: Icons.info,text: "More savings account info",onTap: (){
                  Navigator.pop(context);
                }),
                buildMenuOption(icon: Icons.description,text: "Documents",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.documentSavingAccountClient,arguments: controller.idSavingAccount);
                })
              ]);
            },
          ),
        ],
      ),
      body: Obx((){
        if(controller.isLoding.value)
        {
          return LoadingListWidget();
        }
        final savingAccount = controller.savingAccountClient.value;
        return Padding(
          padding: EdgeInsets.all(32.sp),
          child: Column(
            children: [
              Card(
                color: AppColor.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.sp),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(32.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      savingAccount.savingsProductName!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: AppConst.getLoanColor(savingAccount.status!.value!),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          savingAccount.savingsProductName!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "#${savingAccount.accountNo}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                      buildInfoItemLoanAccount('Client Name', "-"),
                      SizedBox(height: 32.h),
                      buildInfoItemLoanAccount('Account Balnace', "-"),
                      SizedBox(height: 16.h),
                      buildInfoItemLoanAccount('Total Desposits', "-"),
                      SizedBox(height: 16.h),
                      buildInfoItemLoanAccount('Total Withdrawals', "-"),
                      SizedBox(height: 16.h),
                      buildInfoItemLoanAccount('Interest Earned', "-"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.sp),
              Row(
                children: [
                  Text("Transactions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),textAlign: TextAlign.start,),
                ],
              ),
              Expanded(child: _buildTransactionList()),
              SizedBox(height: 10.sp),
              _buildActionButtons()
            ],
          ),
        );
      } ),
    );
  }

  Widget _buildTransactionList() {
    return Obx(() => ListView.builder(
          itemCount: controller.transactions.length,
          itemBuilder: (context, index) {
            var transaction = controller.transactions[index];
            return Card(
              elevation: 2,
              color: AppColor.white,
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
        Expanded(
          child: CustomButton(onPressed: () {
              controller.withdraw(50.0);
            }, text: "Withdrawal"),
        ),
        SizedBox(width: 10.sp,),
        Expanded(
          child: CustomButton(onPressed: () {
              controller.makeDeposit(100.0);
            }, text: "Make Deposit"),
        ),
        
      ],
    );
  }
}