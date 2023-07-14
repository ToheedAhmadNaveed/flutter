import 'dart:async';
import 'package:get/get.dart';
import 'package:mvvm_clone/res/routes/routes_name.dart';
import 'package:mvvm_clone/screen_models/controller/user_preference/user_preferences_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();

  void isLogin() {
    Timer(const Duration(seconds: 3), () {
      Get.toNamed(RoutesName.login_screen);
    });
    // userPreferences.getUser().then((value) {
    //   if (value.token!.isEmpty || value.token.toString() == null) {
    //     Timer(const Duration(seconds: 3), () {
    //       Get.toNamed(RoutesName.login_screen);
    //     });
    //   } else {
    //     Timer(const Duration(seconds: 3), () {
    //       Get.toNamed(RoutesName.home_screen);
    //     });
    //   }
    // });
  }
}
