import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';


class NextButton extends StatelessWidget {
  final label;

  const NextButton(this.label);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      height: SizeConfig.blockSizeVertical * 8,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Home');
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