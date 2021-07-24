import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/search_screen_widgets/category_widget.dart';
import 'package:movy_rek_app/widgets/search_screen_widgets/listview_widget.dart';
import 'package:movy_rek_app/widgets/search_screen_widgets/header_widget.dart';
import 'package:movy_rek_app/widgets/search_screen_widgets/movie_smart_list.dart';
import 'package:movy_rek_app/widgets/search_screen_widgets/search_textfield_widget.dart';


import '../styles.dart';

class SearchPage extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<SearchPage>{

  final TextEditingController controller = TextEditingController();

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
          title: SearchHeader(),
        ),

        body: Container(
          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryText(),
                ],
              ),
              SizedBox(height: 1,),
              SearchTextField(controller: this.controller,),
              SizedBox(height: 15,),
              controller.value.text == '' ? Container():
              Expanded(child: MovieListWidget(controller.value.text)),

            ],
          ),
        ),


      ),
    );
  }

}