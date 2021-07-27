import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/model/movie_reviews_model.dart';
import 'package:movy_rek_app/model/review_model.dart';
import 'package:movy_rek_app/model/user_review_model.dart';
import 'package:movy_rek_app/view_model/review_service.dart';
import 'package:movy_rek_app/view_model/user_review_service.dart';
import 'package:movy_rek_app/widgets/general_widgets/general_toast_widget.dart';

class CommentWidget extends StatefulWidget {
  int movieId;

  CommentWidget(this.movieId);

  @override
  _Comment createState() => _Comment();
}

class _Comment extends State<CommentWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  Future<MovieReview> futureData;

  @override
  void initState() {
    super.initState();
    futureData = ReviewApi(widget.movieId).fetchData();
  }

  Widget commentChild() {
    return FutureBuilder<MovieReview>(
        future: futureData,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Review> reviewsList = snapshot.data.reviews;
            return Container(
                child: ListView.builder(
                    itemCount: reviewsList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      String imageUrl = checkImageUrl(
                          reviewsList[index].authorDetails.avatarPath);
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                        child: ListTile(
                          leading: GestureDetector(
                            onTap: () async {
                              // Display the image in large form.
                              print("Comment Clicked");
                            },
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: new BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(50))),
                              child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(imageUrl)),
                            ),
                          ),
                          title: Text(
                            reviewsList[index].author,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(reviewsList[index].content),
                        ),
                      );
                    }));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
          child: commentChild(),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () async {
            if (formKey.currentState.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                      'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
//                filedata.insert(0, value);
              });
              UserReview userReview = await UserReviewApi().addReview(widget.movieId, commentController.text);
              print(userReview.message);
              GeneralToast(userReview.message).toast();
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  String checkImageUrl(String url) {
    String baseUrl = "https://secure.gravatar.com/avatar";
    String defaultUrl =
        "https://secure.gravatar.com/avatar/sKeC7qZLAKreuwxH4x6U3mN7Aa8.jpg";
    String finalUrl;

    if (url == null) {
      finalUrl = defaultUrl;
    } else if (url.contains(baseUrl)) {
      finalUrl = url.substring(1);
    } else {
      finalUrl = baseUrl + url;
    }

    return finalUrl;
  }
}
