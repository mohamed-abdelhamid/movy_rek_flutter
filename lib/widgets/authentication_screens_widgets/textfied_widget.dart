import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:movy_rek/view_model/size_config.dart';

import '../../styles.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final MultiValidator validator;

  AuthTextField({this.label, this.controller, this.isPassword, this.validator});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1),
      decoration: kRegistrationTextFieldDecoration,
      child: TextFormField(
       // autovalidateMode: AutovalidateMode.onUserInteraction,
        autovalidate: false, // need to handel
        controller: controller,
        validator: validator,
        obscureText: isPassword,
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
