import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movy_rek/model/user.dart';
import 'package:movy_rek/view_model/size_config.dart';
import '../../styles.dart';

// ignore: must_be_immutable
class AuthDatePicker extends StatefulWidget {

  PrimitiveWrapper birthDate;
  AuthDatePicker({this.birthDate});

  @override
  _AuthDatePickerState createState() => _AuthDatePickerState();
}

class _AuthDatePickerState extends State<AuthDatePicker> {
  DateTime _pickedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate == null)
      {
        return;
      }
      setState(() {
        _pickedDate = pickedDate;
        widget.birthDate.value = _pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1),
      decoration: kRegistrationTextFieldDecoration,
      child: Padding(
        padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 2, right: SizeConfig.blockSizeHorizontal * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 7,
                child: Text(_pickedDate == null ? 'BirthDate' : 'Picked Date :${DateFormat.yMd().format(_pickedDate)}',style: kGeneralTextPickerStyle,)),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: _presentDatePicker,
                icon: Icon(Icons.date_range,color: Colors.grey[700],),
              ),
            )
          ],
        ),
      ),
    );
  }
}
