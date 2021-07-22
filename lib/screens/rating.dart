import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/rate_movie_screen_widgets/next_movie_button.dart';
import '../widgets/rate_movie_screen_widgets/movie_card_widget.dart';
import '../widgets/rate_movie_screen_widgets/rating_screen_header.dart';
//import 'package:movy_rek/widgets/rate_movie_screen_widgets/header_widget.dart';

class RateMovie extends StatefulWidget {
  //const RateMovie({ Key? key }) : super(key: key);

  @override
  _RateMovieState createState() => _RateMovieState();
}

class _RateMovieState extends State<RateMovie> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                  child: Container(child: NextButton('Next Movie')),
                )
              ],
            ),
          )),
    );
  }


}