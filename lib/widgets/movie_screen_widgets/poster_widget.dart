import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final imageURL = "https://image.tmdb.org/t/p/w200/";
  String poster;

  Poster(this.poster);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: CachedNetworkImage(
          imageUrl: '$imageURL$poster',
          fit: BoxFit.contain,
          placeholder: (context,url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context,url,error) => Center(child: Text('Image not available')),
        ),
      );
  }
}
