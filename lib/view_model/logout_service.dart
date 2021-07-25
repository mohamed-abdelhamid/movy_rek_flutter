import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/local_storage.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/movie_page_model.dart';


class LogoutApi {
  SecureStorage secureStorage = new SecureStorage();
  Future<String> postData() async {
    String token = await secureStorage.getToken('token');
    http.Response res = await http.post(Uri.parse(kLogoutEP),headers: {
      'Authorization' : 'Bearer $token',
    });

    if (res.statusCode == 200) {
      String data = res.body;
      secureStorage.deleteAll();
      return "logout";

    } else {
      print("statusCode= ${res.statusCode}");
    }
  }
}