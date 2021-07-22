 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';

class ProfileSupport extends StatelessWidget{
  String label;

  ProfileSupport(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 0.5,bottom: SizeConfig.blockSizeVertical * 2,left: 10),
        child:Text("${label}",style: TextStyle(fontSize: 25,color: Color(0xffec1331)),));

  }

}