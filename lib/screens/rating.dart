import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/size_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:movy_rek/widgets/rate_movie_screen_widgets/header_widget.dart';
import 'package:movy_rek/widgets/rate_movie_screen_widgets/next_movie_button.dart';

class RateMovie extends StatefulWidget {
  //const RateMovie({ Key? key }) : super(key: key);

  @override
  _RateMovieState createState() => _RateMovieState();
}

class _RateMovieState extends State<RateMovie> {
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
            centerTitle: true,
            title: Image.asset(
              'assets/images/temp.png',
              fit: BoxFit.fitHeight,
              width: 50.0,
              height: 50.0,
            ),
            leading: RawMaterialButton(
              elevation: 2.0,
              fillColor: Colors.white,
              onPressed: () {
                helpDialog(context);
              },
              shape: CircleBorder(),
              child: Text(
                "?",
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              RawMaterialButton(
                elevation: 2.0,
                fillColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/Home');
                },
                shape: RoundedRectangleBorder(),
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
              ),
            ],
          ),
          body: Column(
            children: [
              Center(
                child: Text(
                  'Rate this movie',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 400.0,
                height: 500.0,
                padding: EdgeInsets.all(20.0),
                child: Card(
                  margin: EdgeInsets.all(5.0),
                  elevation: 16.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/poster.jpg',
                          ),
                          height: 300.0,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 4,
                        ),
                        Text(
                          'SpiderMan',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 4,
                        ),
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal:2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 4),
              Center(
                child: Container(child: NextButton('Next Movie')),
              )
            ],
          )),
    );
  }

  void helpDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Rate movies to receive recommendations'),
      content: Text(
        'Rate the following movies according to your preferences. '
            'You can click NEXT MOVIE to go to the next movie. '
            'You can also press the skip button to go to the home page.',
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