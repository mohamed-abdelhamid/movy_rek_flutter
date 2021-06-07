import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/category_provider.dart';
import 'package:movy_rek/screens/category.dart';
import 'package:movy_rek/screens/home.dart';
import 'package:movy_rek/screens/movie.dart';
import 'package:movy_rek/screens/profile.dart';
import 'package:movy_rek/screens/search.dart';
import 'package:provider/provider.dart';
import 'screens/register.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(),
        ),
      ],
      child: MaterialApp(
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
          '/Category': (context) => CategoryPage(),
          '/Profile': (context) => ProfilePage(),
          '/Movie': (context) => MoviePage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
