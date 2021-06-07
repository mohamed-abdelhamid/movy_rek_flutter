import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/widgets/search_screen_widgets/category_widget.dart';
import 'package:movy_rek/widgets/search_screen_widgets/header_widget.dart';
import 'package:movy_rek/widgets/search_screen_widgets/search_textfield_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<SearchPage>{


  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 76,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: SearchHeader(),
        ),

        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Category(),
                ],
              ),
              SizedBox(height: 15,),

              SearchTextField()
            ],
          ),
        ),


      ),
    );
  }

}