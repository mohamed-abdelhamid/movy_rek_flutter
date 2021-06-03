import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/screens/home.dart';
import 'package:movy_rek/screens/search.dart';
import 'screens/register.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red[900],
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (context) => Login(),
        '/Registration': (context) => Registration(),
        '/Home': (context) => Home(),
        '/Search': (context) => SearchPage(),
      },
      initialRoute: '/',
    );
  }
}
