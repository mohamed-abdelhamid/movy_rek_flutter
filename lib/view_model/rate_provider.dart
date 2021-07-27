import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/networking.dart';
import 'package:movy_rek_app/model/rate_model.dart';

class RateProvider extends ChangeNotifier{


  Future<String> addRate(Rate rate, int movieId)async{
    Map<String,dynamic> _toJson = {
      'rating': rate.rating,
    };
    var body = JsonEncoder().convert(_toJson);
    print("url : "+kMovieRateEP+'$movieId');
    print(rate);
    print(body.runtimeType);
    Networking net = Networking(
        url: kMovieRateEP+'$movieId',
        body:body
    );
    var response = await net.addData();
    return response.toString();
  }

  Future<String> updateRate(Rate rate, int movieId)async{
    Map<String,dynamic> _toJson = {
      'rating' : rate.rating,
    };
    var body = json.encode(_toJson);
    Networking net = Networking(
        url: kMovieRateEP+'$movieId',
        body:body
    );
    var response = await net.updateData();
    return response.toString();
  }




}