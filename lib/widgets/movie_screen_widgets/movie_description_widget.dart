import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MovieDescription extends StatelessWidget{
  String description;

  MovieDescription(this.description);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("Description" ,style: TextStyle(color:  Color(0xffec1331),fontSize: 25,fontWeight: FontWeight.bold),),
        SizedBox(height: 5,),
        //Text("${description}" ,style: TextStyle(color: Colors.black,fontSize: 18),)
        ReadMoreText(
          "${description}",
          style: TextStyle(fontSize: 18),
          trimLines: 4,
          colorClickableText: Colors.red,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

}