import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movy_rek_app/model/rate_model.dart';
import 'package:movy_rek_app/view_model/rate_movie_provider.dart';
import 'package:movy_rek_app/view_model/rate_provider.dart';
import 'package:provider/provider.dart';

class RatingBarWidget extends StatelessWidget{
  var rate;

  RatingBarWidget(this.rate);

  @override
  Widget build(BuildContext context) {
    var movie = Provider.of<RateMovieProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: movie.movieRate,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ), onRatingUpdate: (double value) {
            Rate rate = Rate(rating: value);
            if(movie.movieRate == 0.0){
              // add
              movie.updateInitRate(value);
              Provider.of<RateProvider>(
                  context,
                  listen: false)
                  .addRate(rate,movie.movieId);
              print("add rate");

            }else{
              //update
              Provider.of<RateProvider>(
                  context,
                  listen: false)
                  .updateRate(rate,movie.movieId);
              print("update");
            }
        },

        )
      ],
    );

  }

}