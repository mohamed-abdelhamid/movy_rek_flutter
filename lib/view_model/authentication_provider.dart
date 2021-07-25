import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/local_storage.dart';
import 'package:movy_rek_app/model/networking.dart';
import 'dart:convert';
import 'package:movy_rek_app/model/user.dart';


class AuthenticationProvider extends ChangeNotifier{

  SecureStorage secureStorage = new SecureStorage();

  Future<Map> register(User user) async {
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
    var dic = await net.getData();
    Map response = jsonDecode(dic['body']);
    var code = dic['code'];
    Map result = {};
    if(code == 200) {
      secureStorage.writeToken('token', response['access_token']);
      secureStorage.writeToken('username', user.username);
      print("username : "+ await secureStorage.getToken('username'));
      print("token :"+ await secureStorage.getToken('token'));
      result['message'] = response['message'];
      result['code'] = code;
      return result;
      //print(await storage.read(key: 'token'));
    }else if (code == 409){
      result['message'] = response['message'];
      result['code'] = code;
      return result;
    }

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
    var dic = await net.getData();
    Map response = jsonDecode(dic['body']);
    var code = dic['code'];
    if(code == 200) {
      secureStorage.writeToken('token', response['access_token']);
      secureStorage.writeToken('username', user.username);
      print(await secureStorage.getToken('token'));
      return "true";
      //print(await storage.read(key: 'token'));
    }else if (code == 401){

      return "incorrect";
    }else{
      return "not";
    }

  }

  Future<Map> activate(User user) async {
    String username = await secureStorage.getToken('username');
//    print("jshdjhdjhsjdh"+username);
//    print("jshdjhdjhsjdh"+user.code);
    Map<String,dynamic> _toJson = {
      "username": username,
      "activ_code": user.code,
    };
    var body = json.encode(_toJson);
    Networking net = Networking(
        url: kActivateEP,
        body:body
    );
    var dic = await net.getData();
    print("-----------------"+ dic['body'].toString());
    Map response = jsonDecode(dic['body']);
    var code = dic['code'];
    Map result = {};
    if(code == 200) {

      result['message'] = response['message'];
      result['code'] = code;
      return result;
      //print(await storage.read(key: 'token'));
    }else if (code == 403){
      result['message'] = response['message'];
      result['code'] = code;
      print("Map Message : "+ response ['message']);
      return result;
    }

  }





}