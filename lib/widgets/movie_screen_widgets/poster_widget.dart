import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';

class Poster extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: SizeConfig.blockSizeVertical * 30,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: new ExactAssetImage('assets/images/poster.jpg'),
        ),
      ),
    );
  }

}