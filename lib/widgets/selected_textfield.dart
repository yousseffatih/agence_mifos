import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/charge_template.model.dart';
import '../theme/app_color.dart';

class SelectableTextField extends StatelessWidget {
  const SelectableTextField({
    super.key,
    required this.textEditingController,
    required this.options,
    required this.hint,
    this.bgColor = AppColor.white,
    this.suffix,
  });

  final TextEditingController textEditingController;
  final List<ChargeOption> options;
  final String hint;
  final Color? bgColor;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: textEditingController.text.isNotEmpty ? textEditingController.text : null,
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option.id.toString(),
          child: Text(option.name!),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          textEditingController.text = newValue;
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: bgColor,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.sp),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 35.w,
          vertical: 35.h,
        ),
      ),
    );
  }
}