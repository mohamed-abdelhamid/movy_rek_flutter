import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:movy_rek/model/user.dart';
import 'package:movy_rek/view_model/authentication_provider.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/button_widget.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/textfied_widget.dart';
import 'package:provider/provider.dart';
import '../styles.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
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
              AuthTextField(
                label:'Username',
                controller: usernameController,
                isPassword: false,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'username is required'),
                ]),
              ),
              AuthTextField(
                label:'Password',
                controller: passwordController,
                isPassword: true,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'password is required'),
                  MinLengthValidator(8, errorText: 'password must be at least 8 digits'),
                  PatternValidator(r'(?=.*?[#?!@$%^&*-_])', errorText: 'passwords must have at least one special character'),
                ]),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 2),
              AuthButton(
                label:'Login',
                onPressed: (){
                  if(formKey.currentState.validate()){
                    User user = User(
                      username: usernameController.text,
                      password: passwordController.text,
                    );
                    Provider.of<AuthenticationProvider>(context,listen: false).login(user);
                  }
                },
              ),
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
                        onTap: (){
                          Navigator.pushNamed(context, 'register');
                        },
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
      ),
    );
  }
}
