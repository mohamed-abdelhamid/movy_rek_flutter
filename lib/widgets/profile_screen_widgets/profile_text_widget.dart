
import 'package:flutter/cupertino.dart';

class ProfileText extends StatelessWidget{
  String label;

  ProfileText(this.label);

  @override
  Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.only(left: 10),
         child: Text("${label}",style: TextStyle(fontSize: 20,),));
  }

}