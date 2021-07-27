import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/MovieInteractions.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';
import 'package:movy_rek_app/screens/movie.dart';
import 'package:movy_rek_app/view_model/movie_interactions_service.dart';
import 'package:movy_rek_app/view_model/rate_provider.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/home_screens/recommendation/recommendation_movie_page.dart';
import 'package:provider/provider.dart';

class RecommendationListView extends StatelessWidget {
  Future<MovieRecommendationModel> recommendationData;
  String lable;
  final imageURL = "https://image.tmdb.org/t/p/w300/";

  RecommendationListView(this.recommendationData, this.lable);

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);
    return FutureBuilder<MovieRecommendationModel>(
        future: recommendationData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movies> moviesList = snapshot.data.movies;
            print(moviesList.length);
            return ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: moviesList.length,
              itemBuilder: (BuildContext context, int index) => Card(
                  margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 4,
                      right: SizeConfig.blockSizeHorizontal * 4,
                      bottom: SizeConfig.blockSizeVertical * 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  elevation: 5,
                  child: InkWell(
                    onTap: () async {
//                      MovieInteractions movieInteractions=  await MovieInteractionsApi(moviesList[index].id).fetchData();
//                      double rate = movieInteractions.rating == null ? 0.0 : movieInteractions.rating;
                      if (lable == "category") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoviePageRecommendation(moviesList[index],0)),
                        );
                      } else {
                        _deleteMovieDialog(context, moviesList[index].title);
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical * 40,
                          width: SizeConfig.blockSizeHorizontal * 95,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: CachedNetworkImage(
                                imageUrl: '$imageURL${moviesList[index].posterPath}',
                                fit: BoxFit.fill,
                                placeholder: (context,url) => Center(child: CircularProgressIndicator()),
                                errorWidget: (context,url,error) => Center(child: Text('Image not available')),
                              )),
                        ),
                        SizedBox(
                            height: SizeConfig.blockSizeVertical * 5,
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      strutStyle: StrutStyle(fontSize: 13.0),
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.black),
                                          text: '${moviesList[index].title}'),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ))
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
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
        });
  }

  Future<void> _deleteMovieDialog(
      BuildContext context, String movieName) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(

            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Text('Delete Movie'),
              content: Center(
                  child: Text(
                    movieName,
                    style: TextStyle(color: Colors.black),
                  )),
              actions: <Widget>[
                FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text('CANCEL'),
                  onPressed: () {},
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Delete'),
                  onPressed: () {},
                ),
              ],
            ),
          );
        });
  }
}
