import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/button_widget.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/textfied_widget.dart';

import '../styles.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void registrationScreen(BuildContext context) {
      Navigator.of(context).pushNamed('/Registration');
    }
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 10,
                    bottom: SizeConfig.blockSizeVertical * 1),
                width: SizeConfig.blockSizeHorizontal * 20,
                child: Image.asset(
                  'assets/images/temp.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('Welcome Back!', style: kGeneralTitleStyle),
            AuthTextField('Email address'),
            AuthTextField('Password'),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            AuthButton('LOG IN'),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            GestureDetector(
              child: Text(
                'Forget Password?',
                style: kGeneralTextFieldLabelStyle,
              ),
            ),
            Expanded(
              child: Align(
                // to put the Row at the end of the screen
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New User?',
                      style: kGeneralTextFieldLabelStyle,
                    ),
                    GestureDetector(
                      onTap: (){registrationScreen(context);},
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
