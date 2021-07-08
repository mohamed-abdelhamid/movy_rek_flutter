import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';
import '../../styles.dart';


class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                new CircleAvatar(
                radius: SizeConfig.blockSizeVertical * 7,
                backgroundColor: const Color(0xFFFFFF),
                backgroundImage: NetworkImage("https://www.woolha.com/media/2020/03/eevee.png",), // for Network image

              ), //For Image Asset
              Text("Movie Rec")

                ],
              ),

              decoration: kDrawerHeaderDecoration,),

            Card(
            child: CustomListTile(Icons.account_circle, "Profile", '/Profile'),
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.list),
                title: Text("Watchlist", style: kGeneralTextPickerStyle,),
              ),
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
              child: ListTile(
                leading: Icon(Icons.launch),
                title: Text("Logout", style: kGeneralTextPickerStyle,),
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
