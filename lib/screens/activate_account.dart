import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:movy_rek_app/model/local_storage.dart';
import 'package:movy_rek_app/model/user.dart';
import 'package:movy_rek_app/model/user_info.dart';
import 'package:movy_rek_app/screens/rating.dart';
import 'package:movy_rek_app/view_model/authentication_provider.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/view_model/userinfo_service.dart';
import 'package:movy_rek_app/widgets/authentication_screens_widgets/button_widget.dart';
import 'package:movy_rek_app/widgets/authentication_screens_widgets/textfied_widget.dart';
import 'package:provider/provider.dart';

import '../styles.dart';

class ActivateAccount extends StatefulWidget {
  @override
  _ActivateAccountState createState() => _ActivateAccountState();
}

class _ActivateAccountState extends State<ActivateAccount> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  SecureStorage secureStorage = new SecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/temp.png',
              fit: BoxFit.fitHeight,
              width: SizeConfig.blockSizeVertical * 40,
              height: SizeConfig.blockSizeHorizontal * 40,
            ),
            Form(
              key: formKey,
                child: Column(
              children: [
                Text(
                  "Please enter your activation code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeHorizontal * 2,
                ),
                AuthTextField(
                  label: 'activation code',
                  controller: codeController,
                  isPassword: false,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'code is required'),
                  ]),
                ),
              ],
            )),
            AuthButton(

              label: 'Confirm',
              onPressed: () async {
                //await secureStorage.deleteAll();
                if (formKey.currentState.validate()) {
                  User user = User(
                    code: codeController.text,
                  );

                  Map map = await Provider.of<AuthenticationProvider>(context,
                          listen: false)
                      .activate(user);
                  if (map['code'] == 200) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => RateMovie()));
                  } else {
                    return Fluttertoast.showToast(
                        msg: map['message'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.black,
                        fontSize: 16.0);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
