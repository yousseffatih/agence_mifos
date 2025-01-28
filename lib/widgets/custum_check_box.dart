
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustumeCheckBox extends StatelessWidget {
  const CustumeCheckBox({
    super.key,
    required this.value, required this.hint, required this.onChange,
  });


  final bool value;
  final String hint;
  final Function(bool?) onChange;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChange,
      title: Text(
        hint,
        style: TextStyle(
          fontSize: 39.sp,
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
    );
  }
}