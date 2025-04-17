import 'package:agence_mifos/model/user.model.dart';
import 'package:agence_mifos/route/routes.dart';
import 'package:agence_mifos/storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  StorageService storageService = StorageService();
  User? value;

  @override
  RouteSettings? redirect(String? route) {
    value = storageService.getUser();
    if (value != null) {
      return const RouteSettings(name: AppRoute.home);
    } else {
      return null;
    }
  }
}
