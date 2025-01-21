
import 'package:agence_mifos/global/app_text_style.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/sing_In/sing_up_controller.dart';


class CustomDrawer extends GetView<SignUpController> {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:  BoxDecoration(
              color: AppColor.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 35, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  controller.user.value!.username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  controller.user.value!.officeName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.check_box),
            title:  Text('Checker inbox & Tasks', style: AppTextStyle.sousLabelDrawer,),
            onTap: () {
              Get.back();
              // Navigate to My Order
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist_sharp),
            title:  Text('Individual Collection Sheet',style: AppTextStyle.sousLabelDrawer,),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title:  Text('Collection sheet',style: AppTextStyle.sousLabelDrawer,),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.file_present_rounded),
            title:  Text('Run Reports',style: AppTextStyle.sousLabelDrawer,),
            onTap: () {
              Get.back();
              // Navigate to Payment Methods
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support),
            title:  Text('Path Tracker',style: AppTextStyle.sousLabelDrawer,),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title:  Text('Settings', style: AppTextStyle.sousLabelDrawer,),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title:  Text('About' ,style: AppTextStyle.sousLabelDrawer,),
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title:  Text('Log Out', style: AppTextStyle.sousLabelDrawer,),
            onTap: () async {
              Get.back();
              await controller.logOut();
            },
          ),
        ],
      ),
    );
  }
}