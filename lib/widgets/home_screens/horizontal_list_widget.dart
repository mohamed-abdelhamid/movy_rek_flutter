import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/end_points.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/movie_page_model.dart';
import 'package:movy_rek_app/screens/movie.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/view_model/movie_service.dart';

import '../../styles.dart';

class HorizontalList extends StatefulWidget {
  Future<MoviePageModel> futureData;

  HorizontalList(this.futureData);

  @override
  MovieList createState() => MovieList();
}

class MovieList extends State<HorizontalList> {
  final imageURL = "https://image.tmdb.org/t/p/w300/";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
        height: SizeConfig.blockSizeVertical * 25,
        child: FutureBuilder<MoviePageModel>(
            future: widget.futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Movie> moviesList = snapshot.data.results;
                return ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) => Container(
                    width: SizeConfig.blockSizeHorizontal * 40,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        elevation: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MoviePage(moviesList[index])),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                height: SizeConfig.blockSizeVertical * 18,
                                width: SizeConfig.blockSizeHorizontal * 40,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    child: Image.network(
                                      imageURL + moviesList[index].posterPath,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical * 1.5,
                              ),
                              Container(
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
                              )
                            ],
                          ),
                        )),
                  ),
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
            }));
  }
}
