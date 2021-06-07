import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieName extends StatelessWidget{
  String label;

  MovieName(this.label);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${label}" ,style: TextStyle(color: Colors.black,fontSize: 25),)
      ],
    );
  }

}