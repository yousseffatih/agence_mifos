import 'package:agence_mifos/route/routes.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global/app_const.dart';
import '../../widgets/action_menu/build_menu_option.dart';
import '../../widgets/action_menu/curtom_show_action_menu.dart';
import '../../widgets/custom_info_client.dart';
import '../../widgets/custum_detail_shimmer.dart';
import '../../widgets/custum_expandeble_card.dart';
import 'client_controller.dart';

class ClientScreen extends GetView<ClientController> {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Client',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              showCustomMenu(context,MediaQuery.of(context).size.height * 0.8,[
                buildMenuOption(icon: Icons.add,text: "Add Loan Account",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.addLoan , arguments: controller.clientId);
                }),
                buildMenuOption(icon: Icons.add,text: "Add Savings Account",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.addSavingAccount , arguments: controller.clientId);
                }),
                buildMenuOption(icon: Icons.money,text: "Charges",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.chargesClient , arguments: controller.clientId);
                }),
                buildMenuOption(icon: Icons.description,text: "Documents",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.documentClient , arguments: controller.clientId);
                }),
                buildMenuOption(icon: Icons.person,text: "Identifiers",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.identifierClient , arguments: controller.clientId);
                }),
                buildMenuOption(icon: Icons.info,text: "More client info",onTap: (){}),
                buildMenuOption(icon: Icons.notes,text: "Notes",onTap: (){}),
                buildMenuOption(icon: Icons.location_on,text: "Pinpoint Location",onTap: (){
                  Navigator.pop(context);
                  //Get.toNamed(AppRoute.test , arguments: controller.clientId);
                  Get.toNamed(AppRoute.pinpointClient , arguments: controller.clientId);
                }),
                buildMenuOption(icon: Icons.question_answer,text: "Survey",onTap: (){}),
                buildMenuOption(icon: Icons.upload,text: "Upload Signature",onTap: (){}),
              ]);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return ClientScreenShimmer();
        }

        if (controller.error.value.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }

        final client = controller.client.value;
        if (client == null) {
          return Center(child: Text('No client data available'));
        }

        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom:200.sp, left: 32.sp,right: 32.sp,top: 32.sp),
                child: AnimatedOpacity(
                  opacity: (controller.isScreenHiddenLoan.value || controller.isScreenHiddenSaving.value) ? 0 : 1,
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Center(
                        child: Text(
                          client.displayName!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Card(
                        color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 1,
                        child: Column(
                          children: [
                            ClientInfoItem(
                        icon: Icons.numbers,
                        title: 'Account Number',
                        value: client.accountNo ?? "-",
                      ),
                      ClientInfoItem(
                        icon: Icons.tag,
                        title: 'External ID',
                        value: client.externalId ?? "-",
                      ),
                      ClientInfoItem(
                        icon: Icons.calendar_today,
                        title: 'Activation Date',
                        value: AppConst.dateLabele(client.activationDate),
                      ),
                      ClientInfoItem(
                        icon: Icons.business,
                        title: 'Office',
                        value: client.officeName ?? "-",
                      ),
                      ClientInfoItem(
                        icon: Icons.phone,
                        title: 'Mobile Number',
                        value: client.mobileNo ?? "-",
                      ),
                      ClientInfoItem(
                        icon: Icons.group,
                        title: 'Group',
                        value: controller.groupLabel(client.groups)
                      ),
                          ],
                        ).paddingAll(32.sp),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Accounts',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      ExpandableCard(
                        open: controller.isScreenHiddenLoan.value,
                        title: 'Loan Accounts',
                        onTap: () {
                          controller.toggleScreenVisibility(true);
                        },
                      ),
                      SizedBox(height: 12),
                      ExpandableCard(
                        open: controller.isScreenHiddenSaving.value,
                        title: 'Savings Accounts',
                        onTap: () {
                          controller.toggleScreenVisibility(false);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: controller.isScreenHiddenLoan.value ? 0 : MediaQuery.of(context).size.height,
              left: 0,
              right: 0,
              child: Padding(
              padding:  EdgeInsets.all(32.sp),                
              child: Column(
                  children: [
                    ExpandableCard(
                      open: controller.isScreenHiddenLoan.value,
                      title: 'Loan Accounts',
                      onTap: () {
                        controller.toggleScreenVisibility(true);
                      },
                    ),
                    
                  SizedBox(
                    height:1770.h,
                    child: ListView.builder(
                        itemCount: controller.loanAcount.value!.loanAccounts!.length,
                        itemBuilder: (context, index) {
                          final item = controller.loanAcount.value!.loanAccounts![index];
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              onTap: () => Get.toNamed(AppRoute.loanAccount, arguments: item.id),
                              leading: CircleAvatar(
                                backgroundColor: AppConst.getLoanColor(item.status!.value!),
                                radius: 24.sp, // Size of the circle
                              ),
                              trailing: Text("${item.productId}"),
                              title: Text(item.productName ?? '', style: TextStyle(fontSize: 40.sp,fontWeight:FontWeight.w600),),
                              subtitle: Text('${item.accountNo}',style: TextStyle(fontSize: 35.sp),),
                            ),
                          );
                        },
                      ),
                  ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: controller.isScreenHiddenSaving.value ? 0 : MediaQuery.of(context).size.height,
            left: 0,
            right: 0,
            child: Padding(
              padding:  EdgeInsets.all(32.sp),
              child: Column(
                children: [
                  ExpandableCard(
                    open: controller.isScreenHiddenSaving.value,
                    title: 'Savings Accounts',
                    onTap: () {
                      controller.toggleScreenVisibility(false);
                    },
                  ),
                  SizedBox(
                    height:1770.h,
                    child: ListView.builder(
                      itemCount: controller.loanAcount.value!.savingsAccounts!.length,
                      itemBuilder: (context, index) {
                        final item = controller.loanAcount.value!.savingsAccounts![index];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            onTap : () => {
                            },
                            leading: CircleAvatar(
                              backgroundColor: AppConst.getLoanColor(item.status!.value!),
                              radius: 24.sp, // Size of the circle
                            ),
                            trailing: Text("${item.productId}"),
                            title: Text(item.productName ?? '', style: TextStyle(fontSize: 40.sp,fontWeight:FontWeight.w600),),
                            subtitle: Text('${item.accountNo}',style: TextStyle(fontSize: 35.sp),),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          ],
        );
      }),
    );
  }
}





