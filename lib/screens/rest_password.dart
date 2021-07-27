import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:movy_rek_app/model/user.dart';
import 'package:movy_rek_app/screens/home.dart';
import 'package:movy_rek_app/view_model/authentication_provider.dart';
import 'package:movy_rek_app/widgets/authentication_screens_widgets/button_widget.dart';
import 'package:movy_rek_app/widgets/authentication_screens_widgets/textfied_widget.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_toast_widget.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class RestPassword extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthTextField(
                label: 'username',
                controller: usernameController,
                isPassword: false,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'username is required'),

                ]),
              ),
              AuthTextField(
                label: 'new password',
                controller: newPasswordController,
                isPassword: true,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'password is required'),
                  MinLengthValidator(8, errorText: 'password must be at least 8 digits'),
                  PatternValidator(r'(?=.*?[#?!@$%^&*-_])', errorText: 'passwords must have at least one special character'),

                ]),
              ),

              AuthTextField(
                label: 'verification code',
                controller: codeController,
                isPassword: false,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'username is required'),
                  MinLengthValidator(6, errorText: 'code must be at least 6 digits'),
                ]),
              ),


              AuthButton(

                label: 'Confirm',
                onPressed: () async {
                  //await secureStorage.deleteAll();
                  if (formKey.currentState.validate()) {
                    User user = User(
                      username: usernameController.text,
                        new_password: newPasswordController.text,
                      verif_code: codeController.text
                    );

                    Map map = await Provider.of<AuthenticationProvider>(context,
                        listen: false)
                        .restPassword(user);
                    if (map['code'] == 200) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => Login()));
                    } else {
                      GeneralToast(map['message']).toast();

                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
