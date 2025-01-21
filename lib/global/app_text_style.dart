import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle();
  //===== Sign In ===========

  static TextStyle labelSingIn =  TextStyle(
          color: AppColor.black,
          fontSize: 80.sp,
          fontWeight: FontWeight.bold,
  );

  static TextStyle sousLabelSingIn = TextStyle(
                  color: AppColor.grey,
                  fontSize: 40.sp,
                );
  static TextStyle labelButton = TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.white
        );
  // =========== drawer  ===========
  static TextStyle sousLabelDrawer = TextStyle(
                  color: AppColor.black,
                  fontSize: 35.sp,
                );
  
}