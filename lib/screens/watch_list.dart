import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/movie_model.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_header_widget.dart';

class WatchList extends StatefulWidget {
  @override
  _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  List<Movie> data = List();


  @override
  void initState() {
    super.initState();

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
        body: Container(
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Watch List", style: TextStyle(fontSize: 25)),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),

              //Expanded(child: CategoryListView(data,"watchlist"))
            ],
          ),
        ),
      ),
    );
  }
}

