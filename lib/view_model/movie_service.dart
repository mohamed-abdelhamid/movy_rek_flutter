import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/movie_page_model.dart';


class MovieApi {

  //final String apiUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=631b53c2d55c71c205704a35b2793f8f";
  String apiUrl;

  MovieApi(this.apiUrl);

    Future<MoviePageModel> fetchData({int page = 1}) async {
    http.Response res = await http.get(Uri.parse(apiUrl+'&page=$page'));

    if (res.statusCode == 200) {
      String data = res.body;
      var jsonData = jsonDecode(data);
      MoviePageModel trendingMovie = MoviePageModel.fromJson(jsonData);
      return trendingMovie;

    } else {
      print("statusCode= ${res.statusCode}");
    }
  }
}