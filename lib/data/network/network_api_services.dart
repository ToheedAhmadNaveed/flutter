import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mvvm_clone/data/app_exceptions.dart';
import 'package:mvvm_clone/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_clone/screen_models/controller/user_preference/user_preferences_view_model.dart';

class NetworkApiServices extends BaseApiServices {
  String user_token = '';
  bool isTokenEmpty = true;
  UserPreferences userPreferences = UserPreferences();

  Future<void> setToken() async {
    await userPreferences.getUser().then((value) {
      if (value != null) {
        user_token = value;
        isTokenEmpty = false;
      }
    }).onError((error, stackTrace) {
      print("Error while setting token $error");
    });
  }

  @override
  Future<dynamic> getApi(String url) async {
    await setToken();
    print("the token of the user sius");
    print(user_token);
    if (kDebugMode) {
      print(url);
    }

    dynamic response_JSON;

    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $user_token",
      }).timeout(const Duration(seconds: 10));
      response_JSON = return_response(response);
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOut();
    }

    if (kDebugMode) {
      print(response_JSON);
    }
    return response_JSON;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    await setToken();
    print("the token of the user sius");
    print(user_token);
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;

    try {
      final response = await http
          .post(Uri.parse(url),
              headers: {
                "Authorization": "Bearer $user_token",
              },
              body: data)
          // jsonEncode(
          //     data)) // in raw data the data will encode and if it form data then we remove jsonEncode
          .timeout(const Duration(seconds: 10));
      responseJson = return_response(response);
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOut();
    }

    return responseJson;
  }

  dynamic return_response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(response.statusCode.toString());
    }
  }
}
