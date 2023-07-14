import 'package:flutter/foundation.dart';
import 'package:mvvm_clone/data/network/network_api_services.dart';

import '../../res/app_url/app_url.dart';

class PlayListRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> userListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.playlist_url);
    if (kDebugMode) {
      print(response);
    }
    return response;
  }
}
