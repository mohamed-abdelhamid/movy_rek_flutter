import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movy_rek_app/model/user.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:movy_rek_app/widgets/authentication_screens_widgets/button_widget.dart';
import 'package:movy_rek_app/widgets/authentication_screens_widgets/datepicker_widget.dart';
import 'package:movy_rek_app/widgets/authentication_screens_widgets/textfied_widget.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_header_widget.dart';
import '../styles.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var birthDate = PrimitiveWrapper(DateTime.parse('2000-01-01'));
  var gender = PrimitiveWrapper('m');
  File _image;

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print("_image:$_image");
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: SizeConfig.blockSizeVertical * 11,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: GeneralHeader(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(),
              Text('Edit Profile', style: kGeneralTitleStyle),
              SizedBox(height: SizeConfig.blockSizeVertical * 2),
              CircularProfileAvatar(
                null,
                child: _image == null
                    ? Icon(Icons.add, size: SizeConfig.blockSizeVertical * 6)
                    : Image.file(
                  _image,
                  fit: BoxFit.cover,
                ),
                borderColor: Colors.black,
                borderWidth: 2,
                elevation: 5,
                radius: SizeConfig.blockSizeVertical * 10,
                onTap: _getImage,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              Text(
                "Edit Photo",
                style: kEditProfileTitleStyle,
              ),
              Column(
                children: [
                  AuthTextField(
                    label: 'Username',
                    controller: userNameController,
                    isPassword: false,
                    validator: null,
                  ),
                  AuthTextField(
                    label: 'Password',
                    controller: passwordController,
                    isPassword: true,
                    validator: null,
                  ),
                  AuthTextField(
                    label: 'Confirm Password',
                    controller: confirmPassController,
                    isPassword: true,
                    validator: null,
                  ),
                  AuthTextField(
                    label: 'Email address',
                    controller: emailController,
                    isPassword: false,
                    validator: null,
                  ),
                  AuthDatePicker(
                    birthDate: birthDate, //user's birthday from database
                  ),

                  AuthButton(
                      label: 'Confirm',
                      onPressed: () {
                        Navigator.pushNamed(context, "/Home");
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
