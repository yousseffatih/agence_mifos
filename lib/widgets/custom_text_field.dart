
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Color? bgColor;
  final int? maxLine;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon, 
    this.validator,
    this.maxLine = 1,
    this.bgColor = AppColor.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: bgColor,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.sp),
          borderSide: BorderSide.none,
        ),
        contentPadding:  EdgeInsets.symmetric(
          horizontal: 35.w,
          vertical: 35.h,
        ),
      ),
    );
  }
}