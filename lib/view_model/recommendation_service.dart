import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/local_storage.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/movie_page_model.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';


class RecommendationApi {

  String apiUrl;

  RecommendationApi(this.apiUrl);

  Future<MovieRecommendationModel> fetchData() async {
    SecureStorage secureStorage = SecureStorage();
    String token = await secureStorage.getToken('token');
    http.Response res = await http.get(Uri.parse(apiUrl),headers: {
      'Authorization': 'Bearer $token',
    });

    if (res.statusCode == 200) {
      print("Done");
      String data = res.body;
      var jsonData = jsonDecode(data);
      MovieRecommendationModel movieRecommendationModel = MovieRecommendationModel.fromJson(jsonData);
      print(movieRecommendationModel.movies.length);
      return movieRecommendationModel;

    } else {
      print("statusCode= ${res.statusCode}");
    }
  }
}