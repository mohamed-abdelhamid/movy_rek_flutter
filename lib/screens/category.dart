import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:movy_rek/widgets/general_header_widgets/general_header_widget.dart';
import 'package:movy_rek/widgets/search_screen_widgets/category_widget.dart';
import 'package:movy_rek/widgets/search_screen_widgets/gradview_widget.dart';
import 'package:movy_rek/widgets/search_screen_widgets/search_textfield_widget.dart';

class CategoryPage extends StatelessWidget{


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
          title: GeneralHeader(),
        ),

        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryText(),
                ],
              ),
              SizedBox(height: 15,),

              SearchTextField(),
              SizedBox(height: 15,),
              Expanded(
                child: GradView(),
              )
            ],
          ),
        ),


      ),
    );
  }

}

