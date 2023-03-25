import 'dart:convert';

import 'package:covid_tracker/Models/world_stats_model.dart';
import 'package:covid_tracker/Services/Utilities/app_urls.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  Future<WorldStatsModel> fetchWorldStats() async {
    final response = await http.get(Uri.parse(AppURL.worldStatsAPI));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    } else {
      throw Exception('Failed to load world stats');
    }
  }

  Future<List<dynamic>> fetchCountriesList() async {
    var data;
    final response = await http.get(Uri.parse(AppURL.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load countries list');
    }
  }
}
