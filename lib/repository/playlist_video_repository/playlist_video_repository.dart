import 'package:flutter/foundation.dart';
import 'package:mvvm_clone/data/network/network_api_services.dart';

import '../../res/app_url/app_url.dart';

class PlayListVideoRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> playListVideoApi(String id) async {
    dynamic response = await _apiServices.getApi(AppUrl.playlist_video + id);
    if (kDebugMode) {
      print(response);
    }
    return response;
  }
}
