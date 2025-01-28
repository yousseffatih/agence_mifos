
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustumeDateTimePicker extends StatelessWidget {
  const CustumeDateTimePicker({
    super.key,
    required this.textEditingController, 
    required this.hint, 
    this.bgColor = AppColor.white,
  });


  final TextEditingController textEditingController;
  final String hint;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: bgColor,
        suffixIcon: Icon(Icons.calendar_today, color: AppColor.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.sp),
          borderSide: BorderSide.none,
        ),
        contentPadding:  EdgeInsets.symmetric(
          horizontal: 35.w,
          vertical: 35.h,
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColor.primaryColor, // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: Colors.black, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        AppColor.primaryColor, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat("dd MMMM yyyy").format(pickedDate);
            textEditingController.text = formattedDate;
        }
      },
    );
  }
}
