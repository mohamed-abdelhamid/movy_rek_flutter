import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final imageURL = "https://image.tmdb.org/t/p/w200/";
  String poster;

  Poster(this.poster);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: new NetworkImage((imageURL + poster)),
          ),
        ));
  }
}
