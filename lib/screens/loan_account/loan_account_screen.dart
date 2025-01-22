import 'package:agence_mifos/global/app_const.dart';
import 'package:agence_mifos/model/loan_account.model.dart';
import 'package:agence_mifos/route/routes.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:agence_mifos/widgets/custom_button.dart';
import 'package:agence_mifos/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/action_menu/build_menu_option.dart';
import '../../widgets/action_menu/curtom_show_action_menu.dart';
import '../../widgets/loan_accoun_Item_info.dart';
import '../../widgets/table_row.dart';
import 'loan_account_controller.dart';

class LoanAccountScreen extends GetView<LoanAccountController> {
  const LoanAccountScreen({super.key});

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
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showCustomMenu(context,MediaQuery.of(context).size.height * 0.8,[
                buildMenuOption(icon: Icons.info,text: "More Loan info",onTap: (){}),
                buildMenuOption(icon: Icons.swap_horiz,text: "Transactions",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.transaction , arguments: controller.loanAccoundId);
                }),
                buildMenuOption(icon: Icons.schedule,text: "Loan Replyement schedule",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.repayemntSch , arguments: controller.loanAccoundId);
                }),
                buildMenuOption(icon: Icons.description,text: "Documents",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.document , arguments: controller.loanAccoundId);
                }),
                buildMenuOption(icon: Icons.money,text: "Loan Charges",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.chargeLoan , arguments: controller.loanAccoundId);
                }),
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
        if(controller.loanAccount.id == null)
        {
          return Container();
        }
        final loanAccount = controller.loanAccount;
        return Padding(
        padding:  EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
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
                      loanAccount.clientName!,
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
                            color: AppConst.getLoanColor(loanAccount.status!.value!),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          loanAccount.loanProductName!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "#${loanAccount.accountNo}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    buildInfoItemLoanAccount('Loan Amount Disbursed', loanAccount.repaymentSchedule!.periods![0].principalDisbursed.toString()),
                    SizedBox(height: 16.h),
                    buildInfoItemLoanAccount('Disbursed Date', AppConst.dateLabel2(loanAccount.repaymentSchedule!.periods![0].dueDate)),
                    SizedBox(height: 16.h),
                    buildInfoItemLoanAccount('Loan in arrears', loanAccount.summary == null ? '-':loanAccount.summary!.principalOverdue.toString()),
                    SizedBox(height: 16.h),
                    buildInfoItemLoanAccount('Staff', loanAccount.loanOfficerName!),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Expanded(
              child: Card(
                color: AppColor.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(32.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Summary',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildLoanTable(loanAccount),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity.w,
              child: CustomButton(
                onPressed: (){}, 
                text:controller.getLabel(AppConst.getLoanColor(loanAccount.status!.value!)),
                load: false,color:AppConst.getLoanColor(loanAccount.status!.value!) == Colors.black?Colors.grey:AppColor.primaryColor,
                textColor: AppConst.getLoanColor(loanAccount.status!.value!) == Colors.black? AppColor.black : AppColor.white,)
            )
          ],
        ),
      );
      }),
    );
  }

  

  Widget _buildLoanTable(LoanAccount loanAccount) {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      },
      children: [
        buildTableRow(
          ['Summary', 'Loan', 'Amount Paid', 'Balance'],
          isHeader: true,
        ),
        buildTableRow(['Loan Principal', 
            loanAccount.summary == null ? '-':loanAccount.summary!.principalDisbursed!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.principalPaid!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.principalOutstanding!.toString()
          ]),
        buildTableRow(['Loan Interest', 
            loanAccount.summary == null ? '-':loanAccount.summary!.interestCharged!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.interestPaid!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.interestOutstanding!.toString()
          ],
          backgroundColor: AppColor.primaryColor.withOpacity(0.2)),
        buildTableRow(['Loan Fees', 
            loanAccount.summary == null ? '-':loanAccount.summary!.feeChargesCharged!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.feeChargesPaid!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.feeChargesOutstanding!.toString()
        ]),
        buildTableRow(['Loan Penalty', 
            loanAccount.summary == null ? '-':loanAccount.summary!.penaltyChargesCharged!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.penaltyChargesPaid!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.penaltyChargesOutstanding!.toString()
            ],backgroundColor: AppColor.primaryColor.withOpacity(0.2)),
        buildTableRow(
          ['Total', 
            loanAccount.summary == null ? '-':loanAccount.summary!.totalExpectedRepayment!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.totalRepayment!.toString(), 
            loanAccount.summary == null ? '-':loanAccount.summary!.totalOutstanding!.toString()
          ],
          isHeader: true,
        ),
      ],
    );
  }
}