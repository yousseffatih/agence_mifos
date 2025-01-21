import 'package:agence_mifos/screens/groups/groups_screen.dart';
import 'package:agence_mifos/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../widgets/customer_drawer.dart';
import '../../widgets/custum_navigation_bar.dart';
import '../centers/centers_screen.dart';
import '../clients/clients_screen.dart';
import '../search/search_screen.dart';
import 'navigation_controller.dart';

class MainPage extends GetView<NavigationController> {
  MainPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    SearchScreen(),
    ClientsScreen(),
    CentersScreen(),
    GroupsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColor.primaryColor),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'Dashbord',
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() => _pages[controller.selectedIndex]),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          currentIndex: controller.selectedIndex,
          onTap: controller.changeIndex,
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        foregroundColor:AppColor.white,
        activeForegroundColor: Colors.white,
        backgroundColor: AppColor.primaryColor,
        spacing: 12,
        children: [
          SpeedDialChild(
            child: Icon(Icons.person, color: AppColor.white),
            backgroundColor: AppColor.primaryColor.withOpacity(0.5),
            label: 'Clients',
            labelStyle: TextStyle(fontSize: 14),
          ),
          SpeedDialChild(
            child: Icon(Icons.apartment, color: AppColor.white),
            backgroundColor: AppColor.primaryColor.withOpacity(0.5),
            label: 'Centers',
            labelStyle: TextStyle(fontSize: 14),
          ),
          SpeedDialChild(
            child: Icon(Icons.group, color: AppColor.white),
            backgroundColor: AppColor.primaryColor.withOpacity(0.5),
            label: 'Groups',
            labelStyle: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}