import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import '../../styles.dart';

class RatingListView extends StatelessWidget {

  List<Movies> moviesList;
  final imageURL = "https://image.tmdb.org/t/p/w300/";

  RatingListView(this.moviesList);

  @override
  Widget build(BuildContext context) {
    //print(moviesList[0]);
    if (moviesList.isEmpty) {
      return Column(
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
      );
    } else {
      return ListView.builder(
        itemCount: moviesList.length,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 4,
                  right: SizeConfig.blockSizeHorizontal * 4,
                  bottom: SizeConfig.blockSizeVertical * 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                  '$imageURL${moviesList[index].posterPath}',

                )),
                title: Text(
                  moviesList[index].title,
                  style: kGeneralTextPickerStyle,
                ),
                subtitle: RatingBar.builder(
                    initialRating: moviesList[index].voteAverage / 2,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        )),
              ));
        },
      );
    }
  }
}
