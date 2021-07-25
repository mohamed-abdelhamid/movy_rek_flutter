import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/local_storage.dart';

import 'package:movy_rek_app/model/user_info.dart';


class UserInfoApi {


  Future<UserInfo> fetchData() async {
    SecureStorage secureStorage = SecureStorage();
    String token = await secureStorage.getToken('token');
    http.Response res = await http.get(Uri.parse(kUserInfoEP),headers: {
      'Authorization' : 'Bearer $token',
    });

    if (res.statusCode == 200) {
      //.deleteAll();
      String data = res.body;
      var jsonData = jsonDecode(data);
      UserInfo userInfo = UserInfo.fromJson(jsonData);
      return userInfo;

    } else {
      print("statusCode= ${res.statusCode}");
    }
  }
}