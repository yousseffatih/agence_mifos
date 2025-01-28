import 'dart:ui';

import 'package:agence_mifos/theme/app_color.dart';
import 'package:intl/intl.dart';

class AppConst {
  static const logoUrl = 'assets/images/logo.png';


  static String dateLabele(List<int>? list) {
    if(list!.isNotEmpty)
    {
      return '${list[2]}/${list[1].toString().padLeft(2, '0')}/${list[0]}';
    }
    return "-";
  }

  static String dateLabel2(List<int>? dateArray) {
  if (dateArray!.length != 3 || dateArray.isEmpty || dateArray == null) {
    return "-";
  }

  final year = dateArray[0];
  final month = dateArray[1];
  final day = dateArray[2];

  final dateTime = DateTime(year, month, day);
  return DateFormat('MMM d, yyyy').format(dateTime);
  }

  static Color getLoanColor(String statutValue){
    if(statutValue.contains("Closed") || statutValue.contains('Rejected') || statutValue.contains("Overpaid"))
    {
      return AppColor.black;
    }
    if(statutValue.contains("Approved"))
    {
      return AppColor.primaryColor;
    }
    if(statutValue.contains("Active"))
    {
      return AppColor.green;
    }
    if(statutValue.contains("Submitted"))
    {
      return AppColor.green;
    }
    return AppColor.transparent;
  }
}