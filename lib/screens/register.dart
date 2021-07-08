import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:movy_rek/model/user.dart';
import 'package:movy_rek/view_model/authentication_provider.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/styles.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/button_widget.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/datepicker_widget.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/genderpicker_widget.dart';
import 'package:movy_rek/widgets/authentication_screens_widgets/textfied_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var birthDate = PrimitiveWrapper(DateTime.parse('2000-01-01'));
  var gender = PrimitiveWrapper('m');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                AuthTextField(
                  label:'Username',
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'username is required'),
                  ]),
                  isPassword: false,
                  controller: userNameController,
                ),
                AuthTextField(
                  label:'Password',
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'password is required'),
                    MinLengthValidator(8, errorText: 'password must be at least 8 digits'),
                    PatternValidator(r'(?=.*?[#?!@$%^&*-_])', errorText: 'passwords must have at least one special character'),
                  ]),
                  isPassword: true,
                  controller: passwordController,
                ),
                AuthTextField(
                  label:'Confirm Password',
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'password is required'),
                    MinLengthValidator(8, errorText: 'password must be at least 8 digits'),
                    PatternValidator(r'(?=.*?[#?!@$%^&*-_])', errorText: 'passwords must have at least one special character'),
                  ]),
                  isPassword: true,
                  controller: confirmPassController,
                ),
                AuthTextField(
                  label:'Email address',
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'email is required'),
                    EmailValidator(errorText: 'not valid email'),
                  ]),
                  isPassword: false,
                  controller: emailController,
                ),
                AuthDatePicker(
                  birthDate: birthDate,
                ),
                AuthGenderPicker(
                  gender:gender,
                ),
                AuthButton(
                  label: 'Sign up',
                  onPressed: (){
                    if (formKey.currentState.validate()){
                      if (passwordController.text == confirmPassController.text){
                        User user = User(
                          username: userNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          birthDate: DateFormat('yyyy-MM-dd').format(birthDate.value),
                          gender: gender.value,
                        );
                        Provider.of<AuthenticationProvider>(context,listen: false).register(user);
                        Navigator.pushNamed(context, "/Rate");
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
