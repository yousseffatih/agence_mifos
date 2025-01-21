import 'package:agence_mifos/route/routes.dart';
import 'package:agence_mifos/screens/search/search_controller.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:agence_mifos/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global/app_text_style.dart';
import '../../widgets/loading_list.dart';
import '../../widgets/search_button.dart';
import '../groups/groups_screen.dart';

class SearchScreen extends GetView<SearchControle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => GestureDetector(
                          onTap: () => _showFilterDialog(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.sp, vertical: 8.sp),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20.sp),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.filter_list, color: AppColor.white),
                                SizedBox(width: 40.w),
                                Text(controller.selectedFilter.value,style: TextStyle(color: AppColor.white),),
                              ],
                            ),
                          ),
                        )),
                        
                    
                  ],
                ).paddingAll(20.sp),
                // Row(
                //   children: [
                //     SearchButton(icon: Icons.filter_alt)
                //   ],
                // ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    Text("Name or Account number or Extrenal Id",style: AppTextStyle.sousLabelSingIn,textAlign: TextAlign.start,),
                  ],
                ).paddingOnly(left: 20.sp),
                Row(
                  children: [
                    Expanded(
                      child: Obx(() => CustomTextField(
                        controller: controller.searchController, 
                        hintText: "Search..",
                        suffixIcon: controller.isSearchTextEmpty.value? null: IconButton(
                          onPressed: (){
                            controller.searchController.text = "";
                            controller.items.value = [];
                          },
                          icon:Icon(Icons.close)
                        ),
                      ),
                      )
                    ),
                    SizedBox(width: 20.w,),
                    Obx(()=>SearchButton(icon: Icons.search,load: controller.isLoading.value,onPressed: controller.searchBtn,)),
                  ],
                ).paddingAll(20.sp),
                Obx(() =>
                CheckboxListTile(
                  value: controller.isChecked.value,
                  onChanged: (bool? value) async {
                      controller.isChecked.value = value ?? false;
                      controller.searchBtn();
                    },
                  title: Text(
                    'Exact Match',
                    style: TextStyle(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColor.primaryColor,
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),),
              ],
            )
            ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                  return LoadingListWidget();
              } else if (controller.items.isEmpty) {
                return NoDataExists(text: "No data available", onPressed: controller.searchBtn,icon: Icons.search,);
              } else {
                return ListView.builder(
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
                          final item = controller.items[index];
                          return InkWell(
                            onTap: () {
                              if(item.entityType == "CLIENT")
                              {
                                Get.toNamed(AppRoute.clientByID, arguments: item.entityId);
                              }
                            },
                            child: Card(
                              color: AppColor.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 2,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: AppColor.primaryColor.withOpacity(0.3),
                                  child: Text(item.entityType![0].toUpperCase(), style: TextStyle(fontSize: 60.sp),), // First character of the ID
                                ),
                                title: Text("#${item.entityId} - ${item.entityName}"),
                              ),
                            ),
                          );
                        },
                      );
              }
              
            }
                  ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp),
              topRight: Radius.circular(20.sp),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Filter Search",
                style: TextStyle(fontSize: 58.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              ListView(
                shrinkWrap: true,
                children: [
                  _buildFilterOption(context, "All"),
                  _buildFilterOption(context, "Clients"),
                  _buildFilterOption(context, "Groups"),
                  _buildFilterOption(context, "Loan Accounts"),
                  _buildFilterOption(context, "Savings Accounts"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(BuildContext context, String filter) {
    return Obx(() => RadioListTile<String>(
          value: filter,
          groupValue: controller.selectedFilter.value,
          onChanged: (value) {
            if (value != null) {
              controller.changeFilter(value);
              Navigator.pop(context); // Close the dialog
            }
          },
          title: Text(filter),
        ));
  }
}



