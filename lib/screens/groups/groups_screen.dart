import 'package:agence_mifos/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_color.dart';
import '../../widgets/loading_list.dart';
import 'groups_controller.dart';

class GroupsScreen extends GetView<GroupsController> {
  const GroupsScreen({super.key});
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Obx(() {
      if (controller.isLoading.value) {
        return LoadingListWidget();
      } else if (controller.groups.isEmpty) {
        return NoDataExists(text: "No group available", onPressed: controller.getAllGroups,icon: Icons.group,);
      } else {
        return RefreshIndicator(
          onRefresh: () => controller.getAllGroups(),
          child: ListView.builder(
            itemCount: controller.groups.length,
            itemBuilder: (context, index) {
              final group = controller.groups[index];
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 1,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColor.primaryColor.withOpacity(0.6),
                    child: Icon(Icons.group, color: Colors.white),
                  ),
                  title: Text(
                    group.name!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Get.toNamed(AppRoute.groupByID, arguments: group.id);
                  },
                ),
              );
            },
          ),
        );
      }
    }),
  );
}
}

class NoDataExists extends StatelessWidget {
  const NoDataExists({
    super.key, required this.icon, required this.text, required this.onPressed,
  });

  final IconData icon;
  final String text;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: Colors.grey.withOpacity(0.6),
          ),
          SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 8),
          TextButton(
            onPressed: onPressed,
            child: Text(
              "Refresh",
              style: TextStyle(
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}