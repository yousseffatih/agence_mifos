import 'package:agence_mifos/route/pages.dart';
import 'package:agence_mifos/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/sing_In/sing_in_bindings.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2220),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mifos App',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: const Color(0xFFF2F3F5),
        ),
        initialRoute: AppRoute.signIn,
        getPages: AppPage.pages,
        initialBinding: SingInBindings(),
      ),
    );
  }
}