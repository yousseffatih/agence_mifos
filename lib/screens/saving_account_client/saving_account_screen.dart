import 'package:agence_mifos/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../route/routes.dart';
import '../../widgets/action_menu/build_menu_option.dart';
import '../../widgets/action_menu/curtom_show_action_menu.dart';
import 'saving_account_controller.dart';

class SavingAccountScreen extends GetView<SavingAccountController> {
  const SavingAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Savings Account Summary", style: TextStyle(fontSize: 50.sp),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              showCustomMenu(context,MediaQuery.of(context).size.height * 0.8,[
                buildMenuOption(icon: Icons.info,text: "More savings account info",onTap: (){
                  Navigator.pop(context);
                  
                }),
                buildMenuOption(icon: Icons.description,text: "Documents",onTap: (){
                  Navigator.pop(context);
                  Get.toNamed(AppRoute.documentSavingAccountClient,arguments: controller.idSavingAccount);
                })
              ]);
            },
          ),
        ],
      ),
      body: Obx(()=> controller.isLoding.value? LoadingListWidget():Container()),
    );
  }
}