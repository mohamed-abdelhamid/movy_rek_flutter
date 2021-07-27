import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movy_rek_app/model/rate_model.dart';
import 'package:movy_rek_app/view_model/rate_movie_provider.dart';
import 'package:movy_rek_app/view_model/rate_provider.dart';
import 'package:provider/provider.dart';

class MovieRatingBarWidget extends StatelessWidget{
  double rate;
  int movieId;

  MovieRatingBarWidget(this.rate,this.movieId);

  @override
  Widget build(BuildContext context) {
    print(rate);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: rate,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ), onRatingUpdate: (double value) {
          Rate r = Rate(rating: value);
          if(rate == 0.0){
            Provider.of<RateProvider>(
                context,
                listen: false)
                .addRate(r,movieId);
            print("add rate");

          }else{
            //update
            Provider.of<RateProvider>(
                context,
                listen: false)
                .updateRate(r,movieId);
            print("update");
          }
        },

        )
      ],
    );

  }

}