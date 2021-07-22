import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieName extends StatelessWidget{
  String label;

  MovieName(this.label);

  @override
  Widget build(BuildContext context) {

    return Center(child: Text("${label}" ,style: TextStyle(color: Colors.black,fontSize: 25),textAlign: TextAlign.center,));
  }

}