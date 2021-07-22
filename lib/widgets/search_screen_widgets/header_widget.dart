
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';


import '../../view_model/category_provider.dart';
import 'package:provider/provider.dart';

import 'drop_menu.dart';

class SearchHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CategoryProvider>(context);
    SizeConfig().init(context);
     return Container(
       margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           RawMaterialButton(
             onPressed: () {
               Navigator.pop(context);
               category.setCategory("");
             },
             elevation: 2.0,
             fillColor: Colors.white,
             child: Icon(
               Icons.arrow_back,
               size: 35.0,
               color: Colors.black,
             ),
             padding: EdgeInsets.all(11.0),
             shape: CircleBorder(),
           ),
           Container(
             margin: EdgeInsets.only(top:  SizeConfig.blockSizeVertical * 2),
             child: Text("Category",
             style: TextStyle(fontSize: 25,color: Colors.black),),
           ),
         DropMenu(),
         ],
       ),
     );
  }

}