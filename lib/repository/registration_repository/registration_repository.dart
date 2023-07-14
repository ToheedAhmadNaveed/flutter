import 'package:flutter/foundation.dart';
import 'package:mvvm_clone/data/network/network_api_services.dart';
import 'package:mvvm_clone/res/app_url/app_url.dart';

class RegistrationRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> registrationApi(var data) async {
    print(data);
    dynamic response = await _apiServices.postApi(data, AppUrl.register_url);
    if (kDebugMode) {
      print(response);
    }
    return response;
  }
}
