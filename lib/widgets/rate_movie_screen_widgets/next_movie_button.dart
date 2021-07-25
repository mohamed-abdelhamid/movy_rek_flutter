import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';
import 'package:movy_rek_app/screens/home.dart';
import 'package:movy_rek_app/view_model/rate_movie_provider.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:provider/provider.dart';

class NextButton extends StatelessWidget {
  //String label;
  List<Movies> moviesRateList;

  NextButton(this.moviesRateList);

  @override
  Widget build(BuildContext context) {
    var movie = Provider.of<RateMovieProvider>(context);
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      height: SizeConfig.blockSizeVertical * 8,
      child: MaterialButton(
        onPressed: () {
          movie.updateInitRate(0.0);
          if (movie.count < 10) {
            movie.setMovie(moviesRateList[movie.count]);
          } else {
            movie.updateButtonLabel();
            Navigator.pushReplacement(
                context, new MaterialPageRoute(builder: (context) => Home()));
            //Navigator.pushNamed(context, '/Home');
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Theme.of(context).primaryColor,
        child: Text(
          '${movie.buttonLabel}',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
