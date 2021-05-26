import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';

import '../../styles.dart';

class AuthTextField extends StatelessWidget {
  final String label;

  AuthTextField(this.label);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1),
      decoration: kRegistrationTextFieldDecoration,
      child: TextField(
          decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2, bottom: SizeConfig.blockSizeVertical * 1, top: SizeConfig.blockSizeVertical * 1, right: SizeConfig.blockSizeHorizontal * 2),
        hintText: label,
      )),
    );
  }
}
