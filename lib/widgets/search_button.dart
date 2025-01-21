
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';
import 'loading_circle.dart';

class SearchButton extends StatelessWidget {

  final bool load;
  final IconData icon;
  final VoidCallback onPressed;
  const SearchButton({
    super.key,  this.load=false, required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 140.w,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20.sp)
      ),
      child: load? 
        Center(child: LoadingCircle(height: 120.sp,width: 120.sp,color: AppColor.white,)) 
        : IconButton(onPressed: onPressed, icon: Icon(icon,color: AppColor.white,)),
    );
  }
}