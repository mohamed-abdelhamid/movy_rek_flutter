import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';

class GeneralHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var category = Provider.of<CategoryProvider>(context);
    return Container(
        height: SizeConfig.blockSizeVertical * 8,
        margin: EdgeInsets.only(top: 15),
        child: IntrinsicHeight(
          child: Stack(
            children: [
              Align(
                child: Image.asset(
                  'assets/images/temp.png',
                  fit: BoxFit.fitHeight,
                  width: SizeConfig.blockSizeVertical * 13,
                  height: SizeConfig.blockSizeHorizontal * 13,
                ),
              ),
              Positioned(
                left: 0,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
//              category.setCategory("");
                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back,
                    size: 35.0,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(11.0),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
        ));
  }
}
