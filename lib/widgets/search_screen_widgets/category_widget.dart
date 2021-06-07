import 'package:movy_rek/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class CategoryText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CategoryProvider>(context);
    return Text("${category.category}", style: TextStyle(fontSize: 25));
  }

}