
import 'package:agence_mifos/theme/app_color.dart';
import 'package:agence_mifos/widgets/loading_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool load;
  final Color? color;
  final Color? textColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text, 
    this.load = false, 
    this.color = AppColor.primaryColor, 
    this.textColor = AppColor.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: load? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.sp),
        ),
        padding:  EdgeInsets.symmetric(vertical: 20.h),
      ),
      child: load ? LoadingCircle(
        height: 80,width: 80,color: AppColor.primaryColor,
      ) : Text (
        text,
        style: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
          color: textColor
        ),
      ),
    );
  }
}

