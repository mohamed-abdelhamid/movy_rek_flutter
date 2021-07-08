import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/widgets/home_screens/drawer_widget.dart';
import 'package:movy_rek/widgets/home_screens/header_widget.dart';
import 'package:movy_rek/widgets/home_screens/horizontal_list_button_widget.dart';
import 'package:movy_rek/widgets/home_screens/horizontal_list_widget.dart';
import 'package:movy_rek/widgets/home_screens/list_title_widget.dart';

import '../view_model/size_config.dart';

class Home extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(
            toolbarHeight: SizeConfig.blockSizeVertical * 9,
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: HomeHeader(_scaffoldKey)),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: DrawerWidget(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTitle('Recommendation'),
                HorizontalList(),
                ListTitle('Categories'),
                ListButton(),
                ListTitle('Top 10'),
                HorizontalList(),
                ListTitle('Trending'),
                HorizontalList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
