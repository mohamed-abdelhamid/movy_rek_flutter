
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/widgets/general_header_widgets/general_header_widget.dart';
import 'package:movy_rek/widgets/profile_screen_widgets/divider_widget.dart';
import 'package:movy_rek/widgets/profile_screen_widgets/edit_profile_button_widget.dart';
import 'package:movy_rek/widgets/profile_screen_widgets/profile_support_widget.dart';
import 'package:movy_rek/widgets/profile_screen_widgets/profile_text_widget.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import '../styles.dart';

class ProfilePage extends StatelessWidget{
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
                              child: Icon(
                                Icons.person,
                                size: 140,
                              ),
                              borderColor: Colors.black,
                              borderWidth: 3,
                              elevation: 5,
                              radius: 75,

                             onTap: () {

                             },

                            )

                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Movy Rek",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text("Movyrek@yahoo.com",style: TextStyle(fontSize: 15,),),
                          ],
                        )
                      ],
                    ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EditProfileButton("Edit Profile")
                    ],
                  ),
                  DividerWidget(),
                  ProfileSupport("General"),
                  ProfileText("Notifications"),
                  DividerWidget(),
                  ProfileText("Theme"),
                  DividerWidget(),
                  ProfileText("Watchlist"),
                  DividerWidget(),
                  ProfileText("Notifications"),
                  DividerWidget(),
                  ProfileSupport("Legal"),
                  ProfileText("Terms of Use"),
                  DividerWidget(),
                  ProfileText("Privacy Policy"),
                  DividerWidget(),
                  ProfileSupport("Security"),
                  ProfileText("Change Password"),
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