import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/styles.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/button_widget.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/datepicker_widget.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/genderpicker_widget.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/textfied_widget.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 10,
                        bottom: SizeConfig.blockSizeVertical * 1
                    ),
                    width: SizeConfig.blockSizeHorizontal * 20,
                    child: Image.asset(
                      'assets/images/temp.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Create your account', style: kGeneralTitleStyle),
                AuthTextField('Username'),
                AuthTextField('Password'),
                AuthTextField('Confirm Password'),
                AuthTextField('Email address'),
                AuthDatePicker(),
                AuthGenderPicker(),
                AuthButton('Sign UP'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
