import 'package:flutter/cupertino.dart';
import 'package:movy_rek_app/model/movie_rocommendation_model.dart';

class RateMovieProvider with ChangeNotifier{
  String image = "/vzvKcPQ4o7TjWeGIn0aGC9FeVNu.jpg";
  String name = "The Dark Knight Rises";
  int count = 0;
  int movieId = 49026;
  String buttonLabel = "Next Movie";
  double movieRate = 0.0;
  bool  isVisible = false;



  setMovie(Movies movies){
    image = movies.posterPath;
    name = movies.title;
    movieId = movies.id;
    count++;
    print(movies.id);
    notifyListeners();
  }
  updateButtonLabel(){
    buttonLabel = "Go To Home";
    notifyListeners();
  }
  updateInitRate(double initRate){
    movieRate = initRate;
    notifyListeners();
  }
  updateSkipButton(){
    isVisible = true;
    notifyListeners();
  }
}