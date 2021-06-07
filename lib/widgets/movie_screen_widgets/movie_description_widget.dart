import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("Description" ,style: TextStyle(color:  Color(0xffec1331),fontSize: 25,fontWeight: FontWeight.bold),),
        SizedBox(height: 5,),
        Text("F9 is a 2021 American action film directed by Justin Lin, who also co-wrote the screenplay "
            "with Daniel Casey. It is the sequel to The Fate of the Furious (2017),"
            " the ninth main installment, and the tenth full-length film released overall in the Fast &"
            " Furious franchise." ,style: TextStyle(color: Colors.black,fontSize: 18),)
      ],
    );
  }

}