import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mvvm_clone/data/app_exceptions.dart';
import 'package:mvvm_clone/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic response_JSON;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
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
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;

    try {
      final response = await http
          .post(Uri.parse(url), body: data)
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
