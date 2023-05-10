import 'package:flutter/material.dart';
import 'package:mvvm_with_restapi/data/response/api_response.dart';
import 'package:mvvm_with_restapi/model/movies_model.dart';
import 'package:mvvm_with_restapi/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();
  APIResponse<MovieListModel> moviesList = APIResponse.loading();

  setMoviesList(APIResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    setMoviesList(APIResponse.loading());
    _homeRepo
        .fetchMovies()
        .then((value) => setMoviesList(APIResponse.completed(value)))
        .onError((error, stackTrace) =>
            setMoviesList(APIResponse.error(error.toString())));
  }
}
