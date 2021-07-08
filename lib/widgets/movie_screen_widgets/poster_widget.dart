import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';

class Poster extends StatelessWidget {
  final imageURL = "https://image.tmdb.org/t/p/w200/";
  String poster;

  Poster(this.poster);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: SizeConfig.blockSizeVertical * 30,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: new NetworkImage((imageURL + poster)),
          ),
        ));
  }
}
