import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/genre_model.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:provider/provider.dart';

import '../../view_model/category_provider.dart';

class MovieGenre extends StatelessWidget{
  List<int> genreId;

  MovieGenre(this.genreId);

  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CategoryProvider>(context);

    List<String> genreList = Genre().getGenre(genreId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text("Genres" ,style: TextStyle(color:  Color(0xffec1331),fontSize: 25,fontWeight: FontWeight.bold),),
        ],),
      Container(
        height: SizeConfig.blockSizeVertical * 4,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: genreList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(3),
              child: RaisedButton(
                color: Color(0xffB12608), // background
                textColor: Colors.white, // foreground
                onPressed: () {
                  category.setCategory(genreList[index]);
                  Navigator.pushNamed(context, '/Category');
                },
                shape: new RoundedRectangleBorder(
                  borderRadius:
                  new BorderRadius.circular(10.0),
                ),
                child: Text(genreList[index],),
              ),
            );
          },
        )
      ,)
      ],
    );
  }
//  Text(genreList[index] + ", ",
//  style: TextStyle(fontSize: 18),);
}