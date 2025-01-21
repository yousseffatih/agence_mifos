import 'package:agence_mifos/repository/auth/auth_repository.dart';
import 'package:agence_mifos/route/routes.dart';
import 'package:agence_mifos/storage/storage_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../model/user.model.dart';
import '../../widgets/snak_bar.dart';

class SignUpController extends GetxController {
  SignUpController({required this.repository});
  final AuthRepository repository;
  
  StorageService storage = StorageService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  final isPasswordHidden = true.obs;
  final isLoading = false.obs;
  final _error = Rx<String?>(null);
  final user = Rx<User?>(null);

  @override
  void onInit(){
    user.value = storage.getUser();
    super.onInit();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> signUp() async {
    try {
      
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> logOut() async {
    storage.clearUser();
    Get.offAllNamed(AppRoute.signIn);
  }

  Future<void> login() async {
    isLoading.value = true;
    _error.value = null;
    final result = await repository.login(emailController.text, passwordController.text);
    result.fold(
      (failure) {
        print("Error:${failure.message}");
        SnackbarUtils.showError(failure.message);
        _error.value = failure.message;
      } ,
      (use) {
        print("user:$use");
        user.value = use;
        //SnackbarUtils.showSuccess('Your error message');
        Get.toNamed(AppRoute.home);
      }
    );
    isLoading.value = false;
  }

  String? validator(String? value , String nullMessage){
    if (value == null || value.isEmpty) {
      return nullMessage;
    }
    return null;
  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }
}