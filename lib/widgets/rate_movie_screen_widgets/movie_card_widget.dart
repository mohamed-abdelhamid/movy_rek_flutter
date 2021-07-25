import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';
import 'package:movy_rek_app/view_model/rate_movie_provider.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/widgets/movie_screen_widgets/rating_bar_widget.dart';
import 'package:provider/provider.dart';

class RateMovieCard extends StatelessWidget {


  final imageURL = "https://image.tmdb.org/t/p/w300";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var movie = Provider.of<RateMovieProvider>(context);
    //movie.setCategory(moviesRate);
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
                  child: CachedNetworkImage(
                    imageUrl: '$imageURL${movie.image}',
                    fit: BoxFit.fill,
                    placeholder: (context,url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context,url,error) => Center(child: Text('Image not available')),
                  )

                    ),
              ),


            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),

            Container(
              margin: EdgeInsets.only(left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      strutStyle: StrutStyle(fontSize: 13.0),
                      text: TextSpan(
                          style: TextStyle(color: Colors.black,fontSize: 24.0, fontWeight: FontWeight.bold),
                          text: '${movie.name}'),
                    ),
                  )
                ],
              ),
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
