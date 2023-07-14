import 'package:flutter/foundation.dart';
import 'package:mvvm_clone/data/network/network_api_services.dart';

import '../../res/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.login_url);
    if (kDebugMode) {
      print(response);
    }
    return response;
  }
}
