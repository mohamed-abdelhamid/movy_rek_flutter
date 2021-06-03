import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropMenu extends StatefulWidget {
  @override
  Menu createState() => Menu();
}

class Menu extends State<DropMenu> {
  String dropdownValue ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xffB12608), borderRadius: BorderRadius.circular(10)),

      // dropdown below..
      child: DropdownButton<String>(
          hint: Text('Select Category'),
          value: dropdownValue,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          iconSize: 42,
          underline: SizedBox(),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['Action',
            'Comedy',
            'Drama',
            'Fantasy',
            'Horror',
            'Mystery',
            'Romance',
            'Thriller',
            'Western']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  }
}
