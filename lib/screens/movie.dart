import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/genre_widget.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/movie_description_widget.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/movie_name_widget.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/poster_widget.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/rating_bar_widget.dart';
import 'package:movy_rek/widgets/profile_screen_widgets/cast_widget.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Stack(
          children: [
            Poster(),
            Center(
              child: Card(

                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),

                ),
                color: Colors.white,
                elevation: 5,
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 90,
                  height: SizeConfig.blockSizeVertical * 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MovieName("Movie Name"),
                        RatingBarWidget(),
                        MovieDescription(),
                        MovieGenre(),
                        MovieCast()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical *80,left: 15),
                child: Text("Reviews" ,style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.bold),))

          ],
        )),
      ),
    );
  }
}
