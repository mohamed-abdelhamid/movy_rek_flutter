
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';

class EditProfileButton extends StatelessWidget{
  String label;

  EditProfileButton(this.label);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 60,
      height: SizeConfig.blockSizeVertical * 6,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/EditProfile');
        },
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