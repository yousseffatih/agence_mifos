
import 'package:agence_mifos/route/routes.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'centers_controller.dart';

class CentersScreen extends GetView<CentersController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh:() => controller.getAllCenters(), 
          child: controller.isloading.value ? _buildShimmerLoading() :  ListView.builder(
            padding: EdgeInsets.all(35.sp),
            itemCount: controller.centers.length,
            itemBuilder: (context, index) {
              final center = controller.centers[index];
              return InkWell(
                onTap: () => Get.toNamed(AppRoute.centerByID, arguments: center.id),
                child: Card(
                  margin: EdgeInsets.only(bottom: 20.sp),
                  color: AppColor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 40.sp,
                          height: 40.sp,
                          decoration: BoxDecoration(
                            color: center.active! ? Colors.green : Colors.red,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: center.active! ? Colors.green.withOpacity(0.4) : Colors.red.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 15,
                                offset: Offset(0, 0), // Changes the position of the shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                center.name!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'null',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'BankHive',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    center.officeId!.toString(),
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'null',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'null',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
   Widget _buildShimmerLoading() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 10,  // Show a fixed number of loading items
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            margin: EdgeInsets.only(bottom: 20.sp),
            color: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40.sp,
                    height: 40.sp,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 16.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 14.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 80.sp,
                              height: 14.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 40.sp,
                              height: 14.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 60.sp,
                              height: 14.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 60.sp,
                              height: 14.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

