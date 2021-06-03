import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles.dart';


class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: kImageProfileDecoration
                ),
                SizedBox(width: 10,),
                Text("movy_rek_team",
                style: TextStyle(fontSize: 20,color: Colors.white),)
              ],
            ),

            decoration: kDrawerHeaderDecoration,),

        Card(
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Profile",style: kGeneralTextPickerStyle,),
          ),
        ),

        Card(
          child: ListTile(
            leading: Icon(Icons.list),
            title: Text("Watchlist",style: kGeneralTextPickerStyle,),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.star),
            title: Text("Ratings",style: kGeneralTextPickerStyle,),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.report),
            title: Text("Report Bug",style: kGeneralTextPickerStyle,),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.feedback),
            title: Text("Feedback",style: kGeneralTextPickerStyle,),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.launch),
            title: Text("Logout",style: kGeneralTextPickerStyle,),
          ),
        ),

      ],
    ));
  }
}
