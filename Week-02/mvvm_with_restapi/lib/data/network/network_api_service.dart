import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_with_restapi/data/app_exceptions.dart';
import 'package:mvvm_with_restapi/data/network/base_api_services.dart';

class NetworkAPIService extends BaseAPIServices {
  @override
  Future get(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  Future post(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw InvalidInputException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode.toString()}');
    }
  }
}
