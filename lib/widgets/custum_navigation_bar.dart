
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r)
          )
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.white,
        //     spreadRadius: 1,
        //     blurRadius: 10,
        //   ),
        // ],
      ),
      child: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        items:  [
          SalomonBottomBarItem(
          icon: const Icon(Icons.search),
          title: const Text("Search"),
          selectedColor: AppColor.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Clients"),
            selectedColor: AppColor.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.business_sharp),
            title: const Text("Centers"),
            selectedColor: AppColor.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.group_sharp),
            title: const Text("Groups"),
            selectedColor:AppColor.primaryColor,
          ),
  
        ],
      ),
    );
  }
}