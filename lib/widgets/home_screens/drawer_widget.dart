import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/authentication_provider.dart';
import 'package:movy_rek_app/view_model/logout_service.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../styles.dart';
import 'dart:io' as io;


class DrawerWidget extends StatelessWidget {

  SharedPreferences userData;

  @override
  Widget build(BuildContext context) {
    userData = Provider.of<AuthenticationProvider>(context).userData;
    SizeConfig().init(context);
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                new CircleAvatar(
                radius: SizeConfig.blockSizeVertical * 7,
                  backgroundImage: userData.containsKey("picture") ?
                  FileImage(io.File(userData.getString("picture")))
                      :null,
              ), //For Image Asset
              Text(userData.getString("username")),

                ],
              ),

              decoration: kDrawerHeaderDecoration,),

            Card(
            child: CustomListTile(Icons.account_circle, "Profile", '/Profile'),
            ),

            Card(
              child: CustomListTile(Icons.list, "Watchlist", '/WatchList'),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text("Ratings", style: kGeneralTextPickerStyle,),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.report),
                title: Text("Report Bug", style: kGeneralTextPickerStyle,),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.feedback),
                title: Text("Feedback", style: kGeneralTextPickerStyle,),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.red,
                onTap: () async =>{
                  //Navigator.pushNamed(context, '/'),
                  await LogoutApi().postData(),
                  Navigator.of(context)
                    .pushNamedAndRemoveUntil('/Login', (Route<dynamic> route) => false)
                },
                child: ListTile(
                  leading: Icon(Icons.launch),
                  title: Text("Logout", style: kGeneralTextPickerStyle,
                  ),
                ),
              ),
            ),

          ],
        ));
  }

}
class CustomListTile extends StatelessWidget{
  IconData icon;
  String text;
  String path;

  CustomListTile(this.icon, this.text, this.path);

  @override
  Widget build(BuildContext context) {
      return InkWell(
        splashColor: Colors.red,
        onTap: () =>{Navigator.pushNamed(context, path)},
        child: ListTile(
          leading: Icon(icon),
          title: Text(text, style: kGeneralTextPickerStyle,),
        ),
      );
  }

}
