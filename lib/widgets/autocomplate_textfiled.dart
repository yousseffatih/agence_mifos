
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class AutocomplateTextField extends StatelessWidget {
  const AutocomplateTextField({
    super.key, 
    required this.textEditingController, 
    required this.suggestions, 
    required this.hint, 
    this.bgColor = AppColor.white, 
    this.suffix,
  
  });

  final TextEditingController textEditingController;
  final List<String> suggestions;
  final String hint;
  final Color? bgColor;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return suggestions.where((String option) {
              return option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          fieldViewBuilder: (BuildContext context,
              textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: "Name",
                filled: true,
                fillColor: bgColor,
                suffixIcon: null,
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
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                child: Container(
                  width: MediaQuery.of(context).size.width - 48,
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String option = options.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                        },
                        child: ListTile(
                          title: Text(option),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
    );
  }
}