import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/model/movie_model.dart';
import 'package:movy_rek/model/trending_model.dart';
import 'package:movy_rek/screens/movie.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/view_model/trend_service.dart';
import '../../styles.dart';

class HorizontalList extends StatefulWidget {
  @override
  _MovieList createState() => _MovieList();
}

class _MovieList extends State<HorizontalList> {
  final imageURL = "https://image.tmdb.org/t/p/w300/";
  Future<Trending> futureData;

  @override
  void initState() {
    super.initState();
    futureData = TrendApi().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
        height: SizeConfig.blockSizeVertical * 25,
        child: FutureBuilder<Trending>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Movie> moviesList = snapshot.data.results;
                return ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: moviesList.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    width: SizeConfig.blockSizeHorizontal * 40,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoviePage(
                                      moviesList[index].title,
                                      moviesList[index].overview,
                                      moviesList[index].genreIds,
                                  moviesList[index].backdropPath,
                                  moviesList[index].voteAverage)),
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
                                height: 2,
                              ),
                              Center(
                                  child: Text(
                                '${moviesList[index].title}',
                                style: kGeneralTextPickerStyle,
                                textAlign: TextAlign.center,
                              )),
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
