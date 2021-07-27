import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/local_storage.dart';
import 'package:movy_rek_app/model/user_review_model.dart';

class UserReviewApi {


  Future<UserReview> addReview(int movieId,String review) async {
    SecureStorage secureStorage = SecureStorage();
    String token = await secureStorage.getToken('token');
    //UserReview userReview = UserReview(review: review);
    //var body = userReview.toJson();


    http.Response res = await http.post(
        Uri.parse(kAddReviewEP + '$movieId'),
        headers: {'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'},
          body: jsonEncode(<String, dynamic>{
            'review': review,
          }),);


    if (res.statusCode == 200 || res.statusCode == 409) {
      String data = res.body;
      var jsonData = jsonDecode(data);
      UserReview userReview = UserReview.fromJson(jsonData);
      return userReview;
    } else {
      print("statusCode= ${res.statusCode}");
    }
  }

}
