import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/MovieInteractions.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/model/watchlist_model.dart';
import 'package:movy_rek_app/screens/movie.dart';
import 'package:movy_rek_app/view_model/movie_interactions_service.dart';
import 'package:movy_rek_app/view_model/rate_provider.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/view_model/watchlist_service.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_toast_widget.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../styles.dart';

class CategoryListView extends StatelessWidget {
  var moviesList;
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
                onTap: () async{
//                  MovieInteractions movieInteractions =  await MovieInteractionsApi(moviesList[index].id).fetchData();
//                  double rate = movieInteractions.rating == null ? 0.0 : movieInteractions.rating;
                  if (lable == 'category' || lable == 'search') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoviePage(moviesList[index],0.0)),
                    );
                  } else {
                    //_deleteMovieDialog(context, moviesList[index].title);
                    AlertDialog(context, index);
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
                            imageUrl:
                                '$imageURL${moviesList[index].posterPath}',
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Center(child: Text('Image not available')),
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
              ));
        },
      );
    }
  }

  void AlertDialog(BuildContext context, int index) {
    Alert(
        context: context,
        title: 'Delete Movie',
        content: Column(
          children: <Widget>[
            Text(
              'Do you want delete ' + moviesList[index].title + ' movie ?',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            color: Colors.green,
          ),
          DialogButton(
            onPressed: () async {
              WatchListModel watchListModel = await WatchListApi()
                  .RemoveFromWatchList(moviesList[index].id);
              GeneralToast(watchListModel.message).toast();
              Navigator.pop(context);
            },
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            color: Colors.red,
          )
        ]).show();
  }
}
