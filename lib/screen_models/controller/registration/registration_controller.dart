import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_clone/data/response/status.dart';
import 'package:mvvm_clone/repository/registration_repository/registration_repository.dart';
import 'package:mvvm_clone/res/routes/routes_name.dart';
import 'package:mvvm_clone/screen_models/controller/user_preference/user_preferences_view_model.dart';
import 'package:mvvm_clone/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:mvvm_clone/utils/utils.dart';

class RegistrationController extends GetxController {
  final _api = RegistrationRepository();
  final user_name = TextEditingController().obs;
  final email_controller = TextEditingController().obs;
  final password_controller = TextEditingController().obs;
  final confirm_password_contrller = TextEditingController().obs;
  RxBool privacy_and_terms_accepted = false.obs;
  final phone_focus_node = FocusNode().obs;
  final user_name_focus_node = FocusNode().obs;
  final email_focus_node = FocusNode().obs;
  final password_focus_node = FocusNode().obs;
  final confirm_focus_node = FocusNode().obs;
  Rx<Status> request_status = Status.LOADING.obs;
  RxString error = ''.obs;
  UserPreferences userPreferences = UserPreferences();

  void setRequestStatus(Status value) => request_status.value = value;
  void setError(String value) => error.value = value;

  Future registrationApi() async {
    if (!email_controller.value.text.contains("@")) {
      Util.Snack_Bar("Warning", "Please Enter Valid Email");
    } else if (user_name.value.text.isEmpty) {
      Util.Snack_Bar("Warning", "Please Enter User Name");
    } else if ((password_controller.value.text.length <= 7 &&
        confirm_password_contrller.value.text.length <= 7)) {
      Util.Snack_Bar("Warning", "Your Password is Weak");
    } else if ((password_controller.value.text !=
        confirm_password_contrller.value.text)) {
      Util.Snack_Bar("Warning", "Password does not Match");
    } else if (privacy_and_terms_accepted.value == false) {
      Util.Snack_Bar("Warning", "Please Accept the Terms and Conditons");
    } else {
      setRequestStatus(Status.COMPLETED);
      Map data = {
        "email": email_controller.value.text,
        "name": user_name.value.text,
        "tc": "True",
        "password": password_controller.value.text,
        "password2": password_controller.value.text,
      };
      print(data);

      _api.registrationApi(data).then((value) async {
        if (value["success"] == false) {
          setRequestStatus(Status.LOADING);
          Util.Snack_Bar("Warning", value["result"]);
        } else {
          userPreferences.saveUser(value["token"]["access"]);
          Util.Snack_Bar("Successful", "Registration Successfully");
          Get.to(() => BottomNavigation(index: 0));
          Status status = Status.LOADING;
        }
      }).onError((error, stackTrace) {
        print(error);
        setRequestStatus(Status.ERROR);
      });
    }
  }
}
