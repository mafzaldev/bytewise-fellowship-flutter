import 'package:mvvm_with_restapi/data/network/base_api_services.dart';
import 'package:mvvm_with_restapi/data/network/network_api_service.dart';
import 'package:mvvm_with_restapi/res/app_urls.dart';

class AuthRepository {
  final BaseAPIServices _apiServices = NetworkAPIService();

  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response = _apiServices.post(AppURLs.loginEndpoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signup(dynamic data) async {
    try {
      dynamic response = _apiServices.post(AppURLs.registerEndpoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
