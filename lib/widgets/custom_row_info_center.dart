import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomRowInfoCenter extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const CustomRowInfoCenter({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 18.h),
      child: Row(
        children: [
          Icon(icon, size: 50.sp,color: AppColor.grey,),
          SizedBox(width: 20.w),
          Expanded(
            child: Text(
              label,
              style:  TextStyle(fontSize: 38.sp),
            ),
          ),
          Text(
            value,
            style:  TextStyle(fontSize: 38.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );;
  }
}