
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/cast_widget.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/genre_widget.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/movie_description_widget.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/movie_name_widget.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/movie_rating_bar_widget.dart';
import '../../rate_movie_screen_widgets/rating_bar_widget.dart';



class MovieCardRecommendation extends StatelessWidget{
  Movies movie;
  double rate;

  MovieCardRecommendation(this.movie,this.rate);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      color: Colors.white,
      elevation: 5,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 100,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MovieName(movie.title),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  MovieRatingBarWidget(rate,movie.id),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  MovieDescription(movie.overview),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  MovieGenre(movie.genres),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  MovieCastWidget(movie.id)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}