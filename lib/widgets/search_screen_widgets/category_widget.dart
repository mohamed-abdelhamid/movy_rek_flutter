import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../../view_model/category_provider.dart';

class CategoryText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CategoryProvider>(context);
    return Text("${category.category}", style: TextStyle(fontSize: 25));
  }

}