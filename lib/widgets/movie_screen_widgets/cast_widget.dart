import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCast extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text("Cast" ,style: TextStyle(color:  Color(0xffec1331),fontSize: 25,fontWeight: FontWeight.bold),),
        ],),
        SizedBox(height: 5,),
        Text("Islam, Ahmed, Yussuf, Abd El Hamid, Tawifik." ,style: TextStyle(color: Colors.black,fontSize: 18),)
      ],
    );
  }

}