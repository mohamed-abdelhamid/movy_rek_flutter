
import 'package:flutter/cupertino.dart';
import 'package:movy_rek_app/model/genre_model.dart';


class CategoryProvider with ChangeNotifier{
  String category = "";
  int categoryID;


  setCategory(String c){
    category = c;
    categoryID = Genre().getGenreID(this.category);
    notifyListeners();
  }

}