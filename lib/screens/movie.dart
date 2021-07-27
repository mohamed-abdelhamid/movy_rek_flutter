import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/watchlist_model.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/view_model/watchlist_service.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_toast_widget.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/movie_card.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/poster_widget.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/reviews_button_widget.dart';

class MoviePage extends StatelessWidget {
  Movie movie;
  double rate;

  MoviePage(this.movie,this.rate);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          child: Icon(Icons.playlist_add),
          onPressed: () async {
            WatchListModel watchListModel = await WatchListApi().AddToWatchList(movie.id);
            GeneralToast(watchListModel.message).toast();
          },
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                    height: SizeConfig.blockSizeVertical * 30,
                    child: Poster(movie.backdropPath)),
              ],
            ),
            Positioned(
              left: SizeConfig.blockSizeHorizontal * 5,
              child: Container(
                height: SizeConfig.blockSizeVertical * 9,
                width: SizeConfig.blockSizeHorizontal * 12,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 28,
                    ),
                    Text(
                      '${movie.voteAverage}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Positioned(
                left: SizeConfig.blockSizeHorizontal * 3,
                right: SizeConfig.blockSizeHorizontal * 3,
                top: SizeConfig.blockSizeVertical * 20,
                bottom: SizeConfig.blockSizeVertical * 25,
                child: MovieCard(movie,rate),
              ),
            ),
            Positioned.fill(
              top: SizeConfig.blockSizeVertical * 75,
              child: Align(
                alignment: Alignment.center,
                child: ReviewsButton("Reviews", movie.id),
              ),
            )
          ],
        ),
      ),
    );
  }
}
