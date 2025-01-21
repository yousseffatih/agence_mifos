import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TableRow buildTableRow(List<String> cells, {bool isHeader = false , Color? backgroundColor = null}) {
    return TableRow(
      decoration: BoxDecoration(
        color: backgroundColor
      ),
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            style: TextStyle(
              fontSize: 38.sp,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Colors.black : Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
