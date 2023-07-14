import 'package:flutter/foundation.dart';
import 'package:mvvm_clone/data/network/network_api_services.dart';
import 'package:mvvm_clone/models/home/user_list_model.dart';

import '../../res/app_url/app_url.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();
  Future<UserList> userListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.user_url);
    if (kDebugMode) {
      print(response);
    }
    return UserList.fromJson(response);
  }
}
