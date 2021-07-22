import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/view_model/size_config.dart';

import 'review_widget.dart';

class ReviewsButton extends StatelessWidget {
  String label;
  int movieId;


  ReviewsButton(this.label, this.movieId);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 60,
      height: SizeConfig.blockSizeVertical * 6,
      child: MaterialButton(
        onPressed: () {
          //Navigator.pushNamed(context, '/Home');
          displayModalBottomSheet(context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(width: 5,),
            Icon(Icons.comment,color: Colors.white,)
          ],
        ),
      ),
    );
  }

  void displayModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext bc) {
          return CommentWidget(movieId);
        });
  }
}
