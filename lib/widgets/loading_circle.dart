import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoadingCircle extends StatelessWidget {

  final double width ;
  final double height;
  final Color color;
  const LoadingCircle({
    super.key, 
    required this.width, 
    required this.height, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: CircularProgressIndicator(color: color,));
  }
}