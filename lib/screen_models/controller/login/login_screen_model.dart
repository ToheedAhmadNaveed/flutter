import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
import 'package:mvvm_clone/models/login/user_model.dart';
import 'package:mvvm_clone/repository/login_repository/login_repository.dart';
import 'package:mvvm_clone/res/routes/routes_name.dart';
import 'package:mvvm_clone/utils/utils.dart';
import 'package:mvvm_clone/screen_models/controller/user_preference/user_preferences_view_model.dart';

class LoginScreenController extends GetxController {
  final _api = LoginRepository();
  final email_controller = TextEditingController().obs;
  final password_controller = TextEditingController().obs;

  final email_focus_node = FocusNode().obs;
  final password_focus_node = FocusNode().obs;
  RxString error = ''.obs;
  UserPreferences userPreferences = UserPreferences();
  Rx<Status> request_status = Status.LOADING.obs;

  void setRequestStatus(Status value) => request_status.value = value;
  void setError(String value) => error.value = value;

  void loginApi() {
    if (!email_controller.value.text.contains("@")) {
      Util.Snack_Bar("Warning", "Please Enter Valid Email");
    } else if (password_controller.value.text.isEmpty) {
      Util.Snack_Bar("Warning", "Please Enter Password");
    } else {
      setRequestStatus(Status.COMPLETED);
      Map data = {
        "email": email_controller.value.text,
        "password": password_controller.value.text,
      };
      _api.loginApi(data).then((value) {
        setRequestStatus(Status.LOADING);
        if (value['error'] == 'user not found') {
          Util.Snack_Bar("Warning", value['error']);
        } else {
          setRequestStatus(Status.LOADING);
          userPreferences
              .saveUser(value["token"]["access"])
              .then((value) => null)
              .onError((error, stackTrace) => null);
          Get.toNamed(RoutesName.home_screen);
          print(value["token"]["access"]);
          Util.Snack_Bar("login", "Login Successfully");
        }
      }).onError((error, stackTrace) {
        setRequestStatus(Status.LOADING);
        print(error);
        Util.Snack_Bar("Error", error.toString());
      });
    }
  }
}
