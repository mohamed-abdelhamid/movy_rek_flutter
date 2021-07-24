import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/screens/movie.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import '../../styles.dart';

class CategoryListView extends StatelessWidget {
  List<Movie> moviesList;
  String lable;
  final imageURL = "https://image.tmdb.org/t/p/w300/";


  CategoryListView(this.moviesList, this.lable);

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
              child: InkWell(
                onTap: () {
                  if (lable == "category" || lable == "search" ) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoviePage(moviesList[index])),
                    );
                  }
                  else {
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
                          ),
                          ),
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
              ));
        },
      );
    }
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
