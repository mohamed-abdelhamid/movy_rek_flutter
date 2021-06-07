
import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier{
  String category = "";



  setCategory(String c){
    category = c;
    notifyListeners();
  }
}