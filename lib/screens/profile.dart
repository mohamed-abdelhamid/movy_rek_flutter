import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movy_rek_app/model/user_profile.dart';
import 'package:movy_rek_app/view_model/authentication_provider.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_header_widget.dart';
import 'package:movy_rek_app/widgets/profile_screen_widgets/divider_widget.dart';
import 'package:movy_rek_app/widgets/profile_screen_widgets/edit_profile_button_widget.dart';
import 'package:movy_rek_app/widgets/profile_screen_widgets/profile_support_widget.dart';
import 'package:movy_rek_app/widgets/profile_screen_widgets/profile_text_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../styles.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserProfile _userProfile = UserProfile();
  SharedPreferences userData;
  var img;


  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    img = FileImage(File(image.path));
    await userData.setString("picture", image.path);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,()async{
      await Provider.of<AuthenticationProvider>(context,listen:false).initializePref();
      userData = Provider.of<AuthenticationProvider>(context,listen:false).userData;
      img = FileImage(File(userData.getString("picture")));
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: SizeConfig.blockSizeVertical * 9,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: GeneralHeader(),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
//                          height: SizeConfig.blockSizeVertical * 15,
//                            width: SizeConfig.blockSizeHorizontal * 25,
//                            decoration: kImageProfileDecoration
                          child: CircularProfileAvatar(
                            null,
                            child:img != null ?
                                Image(image: img,fit: BoxFit.fill,)
                                : Icon(Icons.person, size: 140,) ,
                            borderColor: Colors.black,
                            borderWidth: 3,
                            elevation: 5,
                            radius: 75,
                            onTap: _getImage,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userData != null ? userData.getString("username"): 'Username',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userData != null ? userData.getString("email") : 'Email',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [EditProfileButton("Edit Profile")],
                  ),
                  DividerWidget(),
                  ProfileSupport("General"),
                  ProfileText("Notifications"),
                  DividerWidget(),
                  ProfileText("Theme"),
                  DividerWidget(),
                  ProfileSupport("Legal"),
                  ProfileText("Terms of Use"),
                  DividerWidget(),
                  ProfileText("Privacy Policy"),
                  DividerWidget(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}