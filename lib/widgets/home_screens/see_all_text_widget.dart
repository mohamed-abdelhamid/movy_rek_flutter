import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:provider/provider.dart';

import '../../view_model/category_provider.dart';
import '../../styles.dart';

class SeeAllTitle extends StatelessWidget {
  String label;

  SeeAllTitle(this.label);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var category = Provider.of<CategoryProvider>(context);

    return Container(
        margin: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 1.5,
            bottom: SizeConfig.blockSizeVertical * 1.5,
            right: SizeConfig.blockSizeHorizontal * 3),
        child: new GestureDetector(
          onTap: () {
            category.setCategory(label);
            Navigator.pushNamed(context, '/Category');
          },
          child: new Text(
            "See All >",
            style: TextStyle(
              color: Colors.red,
              fontSize: 18.0,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.grey,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        ));
  }
}
