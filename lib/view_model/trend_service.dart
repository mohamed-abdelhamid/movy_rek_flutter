import 'dart:convert';

import 'package:movy_rek/model/trending_model.dart';
import 'package:http/http.dart' as http;


class TrendApi {

  final String apiUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=631b53c2d55c71c205704a35b2793f8f";


  Future<Trending> fetchData() async {
    http.Response res = await http.get(apiUrl);

    if (res.statusCode == 200) {
      String data = res.body;
      var jsonData = jsonDecode(data);
      Trending trendingMovie = Trending.fromJson(jsonData);
      return trendingMovie;

    } else {
      print("statusCode= ${res.statusCode}");
    }
  }
}