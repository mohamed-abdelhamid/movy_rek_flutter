import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/local_storage.dart';

import 'package:movy_rek_app/model/user_info.dart';
import 'package:movy_rek_app/model/watchlist_model.dart';


class WatchListApi {


  Future<WatchListModel> AddToWatchList(int movieId) async {
    SecureStorage secureStorage = SecureStorage();
    String token = await secureStorage.getToken('token');

    http.Response res = await http.post(Uri.parse(kAddToWatchListEP+'$movieId'),headers: {'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token',
    });

    if (res.statusCode == 200 || res.statusCode == 409) {

      String data = res.body;
      var jsonData = jsonDecode(data);
      WatchListModel watchListModel = WatchListModel.fromJson(jsonData);
      return watchListModel;

    }else{

      print("statusCode= ${res.statusCode}");
    }
  }

  Future<WatchListModel> RemoveFromWatchList(int movieId) async {
    SecureStorage secureStorage = SecureStorage();
    String token = await secureStorage.getToken('token');

    http.Response res = await http.delete(Uri.parse(kAddToWatchListEP+'$movieId'),headers: {'Content-Type': 'application/json',
      'Authorization' : 'Bearer $token',
    });

    if (res.statusCode == 200) {

      String data = res.body;
      var jsonData = jsonDecode(data);
      WatchListModel watchListModel = WatchListModel.fromJson(jsonData);
      return watchListModel;

    }else{

      print("statusCode= ${res.statusCode}");
    }
  }
}