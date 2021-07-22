
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';

class DividerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3,bottom: SizeConfig.blockSizeVertical * 3),
      child: Divider(
          thickness: 1,
          indent: 10,
          endIndent: 10,
          color: Colors.grey
      ),
    );
  }

}