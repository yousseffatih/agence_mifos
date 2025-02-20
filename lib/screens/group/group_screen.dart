import 'package:agence_mifos/screens/group/group_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global/app_const.dart';
import '../../route/routes.dart';
import '../../theme/app_color.dart';
import '../../widgets/action_menu/build_menu_option.dart';
import '../../widgets/action_menu/curtom_show_action_menu.dart';
import '../../widgets/custom_info_client.dart';
import '../../widgets/custum_detail_shimmer.dart';
import '../../widgets/custum_expandeble_card.dart';
import '../groups/groups_screen.dart';

class GroupScreen extends GetView<GroupController> {
  const GroupScreen({super.key});

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
          'Group',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              showCustomMenu(context,MediaQuery.of(context).size.height * 0.8,[
                buildMenuOption(icon: Icons.add,text: "Add Loan Account",onTap: (){
                  Navigator.pop(context);
                }),
                buildMenuOption(icon: Icons.add,text: "Add Savings Account",onTap: (){}),
                buildMenuOption(icon: Icons.description,text: "Documents",onTap: (){}),
                buildMenuOption(icon: Icons.group,text: "Group Clients",onTap: (){}),
                buildMenuOption(icon: Icons.info,text: "More Group info",onTap: (){}),
                buildMenuOption(icon: Icons.notes,text: "Notes",onTap: (){}),
                
              ]);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          //return Center(child: CircularProgressIndicator());
          return ClientScreenShimmer();
        }

        if (controller.error.value.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }

        final groupe = controller.group.value;
        if (groupe == null) {
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
                            Icons.group,
                            size: 40,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Center(
                        child: Text(
                          groupe.name!,
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
                        icon: Icons.tag,
                        title: 'External ID',
                        value:  groupe.externalId!,
                      ),
                      ClientInfoItem(
                        icon: Icons.calendar_today,
                        title: 'Activation Date',
                        value: AppConst.dateLabel2(groupe.activationDate!),
                      ),
                      ClientInfoItem(
                        icon: Icons.business,
                        title: 'Office',
                        value:  groupe.officeName,
                      ),
                      
                      ClientInfoItem(
                        icon: Icons.group,
                        title: 'Staff',
                        value: groupe.staffName
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
                    child: controller.loanAcount.value!.loanAccounts?.isEmpty ?? true ?
                    NoDataExists(text: "No data available", onPressed: (){},icon: Icons.inbox,)
                    :ListView.builder(
                        itemCount: controller.loanAcount.value!.loanAccounts!.length,
                        itemBuilder: (context, index) {
                          final item = controller.loanAcount.value!.loanAccounts![index];
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              onTap: ()=> Get.toNamed(AppRoute.loanAccount, arguments: item.id),
                              leading: CircleAvatar(
                                backgroundColor: AppColor.primaryColor,
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
                    child: controller.loanAcount.value?.savingsAccounts?.isEmpty ?? true ?
                    NoDataExists(text: "No data available", onPressed: (){},icon: Icons.inbox,)
                    : ListView.builder(
                      itemCount: controller.loanAcount.value!.savingsAccounts!.length,
                      itemBuilder: (context, index) {
                        final item = controller.loanAcount.value!.savingsAccounts![index];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            onTap: () => Get.toNamed(AppRoute.test, arguments: item.id),
                            leading: CircleAvatar(
                              backgroundColor: AppColor.primaryColor,
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