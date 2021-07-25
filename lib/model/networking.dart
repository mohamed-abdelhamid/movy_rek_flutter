import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/local_storage.dart';
import 'package:movy_rek_app/view_model/authentication_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Networking {
  Networking({this.body, this.url});
  SecureStorage secureStorage = SecureStorage();
  var body;
  String url;

  Future getData() async {
    var dic = {};
    // Await the http get response, then decode the json-formatted response.
    if (body != null) {
      var response;
      if (url == kActivateEP) {
        response = await http.put(Uri.parse(url),
            headers: {"Content-Type": "application/json"}, body: body);
      } else {
        response = await http.post(Uri.parse(url),
            headers: {"Content-Type": "application/json"}, body: body);
      }

      if (response.statusCode >= 200 && response.statusCode < 400) {
        print('success');
        dic["body"] = response.body;
        dic["code"] = response.statusCode;
        print(response.body);
        return dic;
      } else {
        dic["body"] = response.body;
        dic["code"] = response.statusCode;
        print('Request failed with status: ${response.statusCode}.');
        print(response.body);
        return dic;
      }
    }
  }

  Future addData() async {

    if (body != null) {
      String token = await secureStorage.getToken('token');
       var response = await http.post(Uri.parse(url),
           headers: {'Content-Type': 'application/json','Authorization' : 'Bearer $token'}, body: body);
      if (response.statusCode >= 200 && response.statusCode < 400) {
        print('success');
        print(response.body);
        return response.body;
      } else {

        print('Request failed with status: ${response.statusCode}.');
        print(response.body);
        return ;
      }
    }
  }

  Future updateData() async {

    if (body != null) {
      String token = await secureStorage.getToken('token');
      var response = await http.patch(Uri.parse(url),
          headers: {'Content-Type': 'application/json','Authorization' : 'Bearer $token'}, body: body);
      if (response.statusCode >= 200 && response.statusCode < 400) {
        print('success');
        print(response.body);
        return response.body;
      } else {

        print('Request failed with status: ${response.statusCode}.');
        print(response.body);
        return ;
      }
    }
  }


}
