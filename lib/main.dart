import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/res/colors/app_color.dart';
import 'package:mvvm_clone/res/routes/routes.dart';
import 'package:mvvm_clone/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? widget) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: GetMaterialApp(
                // initialBinding: AllControllerBinding(),
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: AppColor.teal900,
                  fontFamily: 'Urbanist',
                ),
                getPages: AppRoutes.appRoutes(),
                home: const SplashScreen(),
              ),
            );
          },
        );
      },
      designSize: const Size(375, 812),
    );
  }
}
