import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_header_widget.dart';
import 'package:movy_rek_app/widgets/search_screen_widgets/search_textfield_widget.dart';
import 'package:movy_rek_app/widgets/search_screen_widgets/category_smart_list.dart';
import 'package:provider/provider.dart';
import '../view_model/category_provider.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CategoryProvider>(context);

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
                  Text("${category.category}", style: TextStyle(fontSize: 25)),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              SearchTextField(),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Expanded(child: CategoryListWidget(category.category))
            ],
          ),
        ),
      ),
    );
  }
}
