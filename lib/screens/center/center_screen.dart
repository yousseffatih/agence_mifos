import 'package:agence_mifos/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global/app_const.dart';
import '../../theme/app_color.dart';
import '../../widgets/custom_row_info_center.dart';
import '../center/center_controller.dart';
import '../../widgets/action_menu/build_menu_option.dart';
import '../../widgets/action_menu/curtom_show_action_menu.dart';
import '../../widgets/custum_detail_shimmer.dart';

class CenterScreen extends GetView<CenterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Center'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showCustomMenu(context,MediaQuery.of(context).size.height * 0.8,[
                buildMenuOption(icon: Icons.add,text: "Add Savings Account",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.addSavingAccount, arguments: controller.centerId);
                }),
                buildMenuOption(icon: Icons.group,text: "Group List",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.groupListCenter, arguments: controller.centerId);
                }),
                
              ]);
            },
          ),
        ],
      ),
      body: Obx(() {
        final center = controller.centerInfo.value;
        if(controller.isLoading.value)
        {
          return ClientScreenShimmer();
        }
        return Padding(
        padding: const EdgeInsets.all(16.0),
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
                  Icons.apartment,
                  size: 40,
                  color: AppColor.primaryColor,
                ),
              ),
            ).paddingSymmetric(vertical: 32.sp),
            Center(
              child: Text(
                center.name!,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              margin: EdgeInsets.only(bottom: 20.sp),
                  color: AppColor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
              child: Column(children: [
                CustomRowInfoCenter(
              icon: Icons.calendar_today,
              label: 'Activation Date',
              value: AppConst.dateLabel2(center.activationDate!),
            ),
            CustomRowInfoCenter(
              icon: Icons.calendar_month,
              label: 'Next Meeting On',
              value: AppConst.dateLabel2(center.collectionMeetingCalendar == null ? []: center.collectionMeetingCalendar!.nextTenRecurringDates![0]),
            ),
            CustomRowInfoCenter(
              icon: Icons.schedule,
              label: 'Meeting Frequency',
              value: center.collectionMeetingCalendar == null? "-": center.collectionMeetingCalendar!.humanReadable!,
            ),
            CustomRowInfoCenter(
              icon: Icons.person,
              label: 'Staff Name',
              value: center.staffName! ?? "-",
            ),
              ],).paddingAll(32.sp),
            ),
            SizedBox(height: 40.h),
            // Summary Info
            Text(
              'Summary Info',
              style: TextStyle(fontSize: 50.sp , fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            Card(
                color: AppColor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              child: Column(
                children: [
                  CustomRowInfoCenter(label: 'Active Clients',value: controller.centerSymmeryInfo.value.activeClients.toString(),icon: Icons.person),
                  CustomRowInfoCenter(label: 'Active Group Loans', value: controller.centerSymmeryInfo.value.activeGroupLoans.toString(),icon: Icons.group),
                  CustomRowInfoCenter(label: 'Active Client Loans',value:  controller.centerSymmeryInfo.value.activeClientLoans.toString(),icon: Icons.person),
                  CustomRowInfoCenter(label: 'Active Group Borrowers',value: controller.centerSymmeryInfo.value.activeGroupBorrowers.toString(),icon: Icons.group),
                  CustomRowInfoCenter(label: 'Active Client Borrowers',value:  controller.centerSymmeryInfo.value.activeClientBorrowers.toString(),icon: Icons.person),
                  CustomRowInfoCenter(label: 'Active Overdue Group Loans',value:  controller.centerSymmeryInfo.value.activeLoans.toString(),icon: Icons.group),
                  CustomRowInfoCenter(label: 'Active Group Loans', value: controller.centerSymmeryInfo.value.activeGroupLoans.toString(),icon: Icons.group),
                ],
              ).paddingAll(32.sp),
            ),
          ],
        ),
      );
      }),
    );
  }
}
