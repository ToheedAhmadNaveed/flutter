import 'package:get/get.dart';
import 'package:mvvm_clone/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences extends GetxController {
  Future<bool> saveUser(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', token);

    return true;
  }

  Future<String?> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');

    return token;
  }
}

Future<bool> removeUser() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.clear();
  return true;
}
