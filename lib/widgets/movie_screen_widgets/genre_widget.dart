import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/model/genre_model.dart';
import 'package:movy_rek/view_model/size_config.dart';

class MovieGenre extends StatelessWidget{
  List<int> genreId;

  MovieGenre(this.genreId);

  @override
  Widget build(BuildContext context) {

    List<String> genreList = Genre().getGenre(genreId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text("Genre" ,style: TextStyle(color:  Color(0xffec1331),fontSize: 25,fontWeight: FontWeight.bold),),
        ],),
      Container(
        height: SizeConfig.blockSizeVertical * 4,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: genreList.length,
          itemBuilder: (context, index) {
            return Text(genreList[index] + ", ",
            style: TextStyle(fontSize: 18),);
          },
        )
      ,)
      ],
    );
  }

}