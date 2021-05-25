import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=>Registration(),
      },
      initialRoute: '/',
    );
  }
}
