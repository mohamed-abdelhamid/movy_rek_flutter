import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:provider/provider.dart';

import '../../view_model/category_provider.dart';
import '../../styles.dart';

class ListTitle extends StatelessWidget {
  String label;

  ListTitle(this.label);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 1.5,
          bottom: SizeConfig.blockSizeVertical * 1.5,
          left: SizeConfig.blockSizeHorizontal * 1),
      child: new Text(
        label,
        style: kGeneralTitleStyle,
      ),
    );
  }
}
