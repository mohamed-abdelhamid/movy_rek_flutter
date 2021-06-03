import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey;

  HomeHeader(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RawMaterialButton(
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
            elevation: 2.0,
            fillColor: Colors.white,
            child: Icon(
              Icons.menu,
              size: 35.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.all(11.0),
            shape: CircleBorder(),
          ),
          Image.asset(
            'assets/images/temp.png',
            fit: BoxFit.fitHeight,
            width: 50.0,
            height: 50.0,
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Search');
            },
            elevation: 2.0,
            fillColor: Colors.white,
            child: Icon(
              Icons.search,
              size: 35.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.all(11.0),
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}
