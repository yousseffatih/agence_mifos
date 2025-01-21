
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global/app_const.dart';
import '../../global/app_text.dart';
import '../../global/app_text_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'sing_up_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(50.0.sp),
          child: Form(
            key: controller.formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 200.h),
                Image.asset(
                  AppConst.logoUrl,
                  height: 400.h,
                ),
                SizedBox(height: 50.h),
                Text(
                  AppText.labelSingIn,
                  style: AppTextStyle.labelSingIn,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  AppText.souslabelSingIn,
                  style: AppTextStyle.sousLabelSingIn,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: AppText.emailAdress, // Email address 
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => controller.validator(value, 'Please enter your username'),
                ),
                const SizedBox(height: 16),
                Obx(() => CustomTextField(
                      validator: (value) => controller.validator(value, 'Please enter your password'),
                      controller: controller.passwordController,
                      hintText: AppText.password, // password 
                      obscureText: controller.isPasswordHidden.value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){},
                    child:  Text(AppText.recoveryPassword), // Recovery password
                  ),
                ),
                const SizedBox(height: 24),
                Obx(() => CustomButton(
                  load: controller.isLoading.value,
                  onPressed: (){
                    if (controller.formkey.currentState?.validate() ?? false){
                      controller.login();
                    }
                  },
                  text: AppText.continueBtn,
                ),)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
