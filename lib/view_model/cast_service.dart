import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/cast_model.dart';



class CastApi {

  int movieId;

  CastApi(this.movieId);

  Future<MovieCast> fetchData() async {
    String url = 'https://api.themoviedb.org/3/movie/${movieId}/credits?api_key=631b53c2d55c71c205704a35b2793f8f&language=en-US';

    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      String data = res.body;
      var jsonData = jsonDecode(data);
      MovieCast movieCast = MovieCast.fromJson(jsonData);
      return movieCast;

    } else {
      print("statusCode= ${res.statusCode}");
    }
  }
}