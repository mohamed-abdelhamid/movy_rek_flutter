import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/rating_bar_widget.dart';

class RateMovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal*3,right:SizeConfig.blockSizeHorizontal*3,bottom: SizeConfig.blockSizeVertical*1
        ),
        elevation: 16.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Container(
              width: SizeConfig.blockSizeHorizontal * 94,
              height: SizeConfig.blockSizeVertical * 50,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child:  Image(
                    image: AssetImage(
                      'assets/images/poster.jpg',
                    ),
                    fit: BoxFit.fill,
                    ),
              ),

            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Text(
              'SpiderMan',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            RatingBarWidget(0),
          ],
        ),
      ),
    );
  }
}
