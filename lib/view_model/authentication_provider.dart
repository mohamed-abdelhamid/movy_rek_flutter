import 'package:flutter/cupertino.dart';
import 'package:movy_rek/model/networking.dart';
import 'package:movy_rek/model/user.dart';
import 'package:movy_rek/model/end_points.dart';
import 'dart:convert';


class AuthenticationProvider extends ChangeNotifier{

  Future<String> register(User user) async {
    Map<String,dynamic> _toJson = {
      "username": user.username,
      "gender": user.gender,
      "birthdate": user.birthDate,
      "email": user.email,
      "full_name": "temp",
      "password": user.password
    };
    var body = json.encode(_toJson);
    Networking net = Networking(
      url: kRegisterEP,
      body:body
    );
    Map response = jsonDecode(await net.getData());
    return response.toString();
  }

  Future<String> login(User user) async {
    Map<String,dynamic> _toJson = {
      "username": user.username,
      "password": user.password
    };
    var body = json.encode(_toJson);
    Networking net = Networking(
        url: kLoginEP,
        body:body
    );
    Map response = jsonDecode(await net.getData());
    return response.toString();
  }

}