import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/movie_reviews_model.dart';

class ReviewApi {
  int movieId;

  ReviewApi(this.movieId);

  Future<MovieReview> fetchData() async {
    String apiUrl =
        "https://api.themoviedb.org/3/movie/${movieId}/reviews?api_key=631b53c2d55c71c205704a35b2793f8f";
    http.Response res = await http.get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      String data = res.body;
      var jsonData = jsonDecode(data);
      MovieReview trendingMovie = MovieReview.fromJson(jsonData);
      return trendingMovie;
    } else {
      print("statusCode= ${res.statusCode}");
    }
  }
}
