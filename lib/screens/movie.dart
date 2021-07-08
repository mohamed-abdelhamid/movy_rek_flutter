import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/genre_widget.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/movie_description_widget.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/movie_name_widget.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/poster_widget.dart';
import 'package:movy_rek/widgets/movie_screen_widgets/rating_bar_widget.dart';
import 'file:///E:/FCI/GP/app/movy_rek_flutter-mohamed-twfiek/lib/widgets/movie_screen_widgets/cast_widget.dart';

class MoviePage extends StatelessWidget {

  String movieName;
  String description;
  List<int> genreId;
  String poster;
  var rate;

  MoviePage(this.movieName, this.description, this.genreId, this.poster, this.rate);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Stack(
          children: [
            Poster(poster),
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
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MovieName(movieName),
                            SizedBox(height: SizeConfig.blockSizeVertical * 2,),
                            RatingBarWidget(rate),
                            SizedBox(height: SizeConfig.blockSizeVertical * 2,),
                            MovieDescription(description),
                            SizedBox(height: SizeConfig.blockSizeVertical * 2,),
                            MovieGenre(genreId),
                            SizedBox(height: SizeConfig.blockSizeVertical * 2,),
                            MovieCast()
                          ],
                        ),
                      ),
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
