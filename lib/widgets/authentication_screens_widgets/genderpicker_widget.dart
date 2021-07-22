import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/user.dart';
import 'package:movy_rek_app/view_model/size_config.dart';


import '../../styles.dart';

class AuthGenderPicker extends StatefulWidget {

   PrimitiveWrapper gender;
  AuthGenderPicker({this.gender});

  @override
  _AuthGenderPickerState createState() => _AuthGenderPickerState();
}

class _AuthGenderPickerState extends State<AuthGenderPicker> {
  String dropdownValue = 'Male';
  List<String> items = <String>['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
      decoration: BoxDecoration(color: Colors.grey[350],borderRadius: BorderRadius.circular(15)),
      width: SizeConfig.blockSizeHorizontal * 90,
      height: SizeConfig.blockSizeVertical * 9,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 5),
      child: Center(
        child: DropdownButtonFormField<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue??'';
              if (newValue == 'Male')
                widget.gender.value='m';
              else if (newValue == 'Female')
                widget.gender.value='f';
            });
          },
          items: <String>['Male', 'Female']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: kGeneralTextPickerStyle,),
            );
          }).toList(),
          decoration: InputDecoration.collapsed(hintText: ''),
        ),
      ),
    );
  }
}
