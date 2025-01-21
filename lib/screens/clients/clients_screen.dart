import 'package:agence_mifos/route/routes.dart';
import 'package:agence_mifos/screens/clients/clients_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_color.dart';
import '../../widgets/loading_list.dart';
import '../groups/groups_screen.dart';

class ClientsScreen extends GetView<ClientsController> {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isloadng.value) {
        return LoadingListWidget();
      } else if (controller.client.isEmpty) {
        return NoDataExists(text: "No client available", onPressed: controller.getAllClients,icon: Icons.group,);
      } else {
        return controller.isloadng.value ? LoadingListWidget():
                    RefreshIndicator(
                      onRefresh: () => controller.getAllClients(), 
                      child: ListView.builder(
                        itemCount: controller.client.length,
                        itemBuilder: (context, index) {
                          final cardData = controller.client[index];
                          return Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 1,
                            child: ListTile(
                              leading:  CircleAvatar(
                                backgroundColor: AppColor.primaryColor.withOpacity(0.6),
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              title: Text(
                                cardData.displayName!,
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(cardData.accountNo!),
                              onTap: () {
                                Get.toNamed(AppRoute.clientByID , arguments: cardData.id!);
                                //Get.toNamed(AppRoute.test);
                              },
                            ),
                          );
                        },
                      ),
                    );
      }
      }
                  ),
    );
  }
}