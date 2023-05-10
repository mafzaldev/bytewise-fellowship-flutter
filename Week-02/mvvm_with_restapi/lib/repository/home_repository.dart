import 'package:mvvm_with_restapi/model/movies_model.dart';
import 'package:mvvm_with_restapi/res/app_urls.dart';
import 'package:mvvm_with_restapi/data/network/base_api_services.dart';
import 'package:mvvm_with_restapi/data/network/network_api_service.dart';

class HomeRepository {
  final BaseAPIServices _apiServices = NetworkAPIService();

  Future<MovieListModel> fetchMovies() async {
    try {
      dynamic response = await _apiServices.get(AppURLs.moviesEndpoint);
      return MovieListModel.fromJson(response);
    } catch (e) {
      throw "usageLimitError";
    }
  }
}
