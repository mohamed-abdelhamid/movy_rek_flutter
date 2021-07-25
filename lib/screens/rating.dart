import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';
import 'package:movy_rek_app/view_model/recommendation_service.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/rate_movie_screen_widgets/next_movie_button.dart';
import '../widgets/rate_movie_screen_widgets/movie_card_widget.dart';
import '../widgets/rate_movie_screen_widgets/rating_screen_header.dart';

class RateMovie extends StatefulWidget {

  @override
  _RateMovieState createState() => _RateMovieState();
}

class _RateMovieState extends State<RateMovie> {
  Future<MovieRecommendationModel> movieRecommendationModel;
  List<Movies> moviesRateList = new List();

  @override
  initState() {
    super.initState();
    RecommendationApi(kRatingMoviesEP).fetchData().then((dataFromServer){
      setState(() {
        moviesRateList = dataFromServer.movies;
      });
    });
  }

  void asyncMethod() async {
    RecommendationApi(kRatingMoviesEP).fetchData().then((dataFromServer){
      setState(() {
        moviesRateList = dataFromServer.movies;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    if(moviesRateList.isEmpty){
      return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: SizeConfig.blockSizeVertical * 11,
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: RatingHeader(),
            ),
            body:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation(Colors.red),
                    ),
                  ),
                ),
              ],
            )),
      );
    }
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: SizeConfig.blockSizeVertical * 11,
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: RatingHeader(),
          ),
          body: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Rate this movie',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                RateMovieCard(),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Center(
                  child: Container(child: NextButton(moviesRateList)),
                )
              ],
            ),
          )),
    );
  }


}