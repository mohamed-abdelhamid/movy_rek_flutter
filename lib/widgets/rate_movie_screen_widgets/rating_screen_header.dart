import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/screens/home.dart';
import 'package:movy_rek_app/view_model/rate_movie_provider.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:provider/provider.dart';

class RatingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movie = Provider.of<RateMovieProvider>(context);
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RawMaterialButton(
            onPressed: () => helpDialog(context),
            elevation: 2.0,
            fillColor: Colors.white,
            child: Icon(
              Icons.feedback,
              size: 35.0,
              color: Colors.black,
            ),
            padding: EdgeInsets.all(11.0),
            shape: CircleBorder(),
          ),
          Image.asset(
            'assets/images/temp.png',
            fit: BoxFit.fitHeight,
            width: SizeConfig.blockSizeHorizontal * 15,
            height: SizeConfig.blockSizeVertical * 7,
          ),
          Visibility(
            visible: movie.isVisible,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => Home()));
              },
              elevation: 2.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "SKIP",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              padding: EdgeInsets.all(11.0),
              //shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }

  void helpDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Rate movies to receive recommendations'),
      content: Text(
        '* You must rate some movies to get personalized recommendations.\n'
        '* You can click NEXT MOVIE to go to the next movie. \n'
        '* You can also press the skip button to go to the home page. \n',
//
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5.0,
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
