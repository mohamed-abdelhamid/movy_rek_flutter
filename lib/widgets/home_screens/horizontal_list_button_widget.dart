import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:provider/provider.dart';

import '../../view_model/category_provider.dart';


class ListButton extends StatelessWidget {
  final List<String> categories = <String>[
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Drama",
    "Fantasy",
    "History",
    "Horror",
    "Music",
    "Mystery",
    "Science Fiction",
    "TV Movie",
    "Thriller",
    "War",
    "Western"
  ];

  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CategoryProvider>(context);
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 7,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) => Container(
            margin: EdgeInsets.all(3),
            width: SizeConfig.blockSizeHorizontal * 40,
            child: RaisedButton(
              color: Color(0xffB12608), // background
              textColor: Colors.white, // foreground
              onPressed: () {
                category.setCategory(categories[index]);
                Navigator.pushNamed(context, '/Category');
              },
              shape: new RoundedRectangleBorder(
                borderRadius:
                new BorderRadius.circular(10.0),
              ),
              child: Text(categories[index],),
            )
        ),
      ),
    );
  }
}
