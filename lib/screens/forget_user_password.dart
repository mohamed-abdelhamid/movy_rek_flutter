import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:movy_rek_app/model/user.dart';
import 'package:movy_rek_app/screens/rest_password.dart';
import 'package:movy_rek_app/view_model/authentication_provider.dart';
import 'package:movy_rek_app/widgets/authentication_screens_widgets/button_widget.dart';
import 'package:movy_rek_app/widgets/authentication_screens_widgets/textfied_widget.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_toast_widget.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
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
                  label: 'email address',
                  controller: emailController,
                  isPassword: false,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'email is required'),
                    EmailValidator(errorText: 'not valid email'),


                  ]),

                ),
                SizedBox(height: 20,),
                AuthButton(

                  label: 'Confirm',
                  onPressed: () async {
                    //await secureStorage.deleteAll();
                    if (formKey.currentState.validate()) {
                      User user = User(
                        email: emailController.text,
                      );

                      Map map = await Provider.of<AuthenticationProvider>(context,
                          listen: false)
                          .forgetPassword(user);
                      if (map['code'] == 200) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => RestPassword()));
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
