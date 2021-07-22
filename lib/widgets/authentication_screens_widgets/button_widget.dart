import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';


import '../../styles.dart';

class AuthButton extends StatelessWidget {
  final label;
  final Function onPressed;

  const AuthButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      height: SizeConfig.blockSizeVertical * 8,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Theme.of(context).primaryColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
