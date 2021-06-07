import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../category_provider.dart';


class ListButton extends StatelessWidget {
  final List<String> categories = <String>[
    'Action',
    'Comedy',
    'Drama',
    'Fantasy',
    'Horror',
    'Mystery',
    'Romance',
    'Thriller',
    'Western',
  ];

  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CategoryProvider>(context);
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) => Container(
            margin: EdgeInsets.all(3),
            width: 180,
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
