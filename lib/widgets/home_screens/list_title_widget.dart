import 'package:flutter/material.dart';

import '../../styles.dart';

class ListTitle extends StatelessWidget{

  String label;

  ListTitle(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7,bottom: 7,left: 3),
      child: Text(
        label,
        style: kGeneralTitleStyle,

      ),
    );
  }

}