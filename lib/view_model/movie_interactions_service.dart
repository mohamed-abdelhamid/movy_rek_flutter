import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/MovieInteractions.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/local_storage.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/movie_page_model.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';


class MovieInteractionsApi {

  int movieId;

  MovieInteractionsApi(this.movieId);

  Future<MovieInteractions> fetchData() async {
    SecureStorage secureStorage = SecureStorage();
    String token = await secureStorage.getToken('token');
    print(kGetRateEP+'$movieId');
    print(token);
    http.Response res = await http.get(Uri.parse(kGetRateEP+'$movieId'),headers: {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token',
    });

    if (res.statusCode == 200) {
      print("Done");
      String data = res.body;
      var jsonData = jsonDecode(data);
      MovieInteractions movieInteractions = MovieInteractions.fromJson(jsonData);
      return movieInteractions;

    } else {
      print("im heeeererererer");
      print("statusCode= ${res.statusCode}");
    }
  }
}