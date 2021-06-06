import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek/view_model/authentication_provider.dart';
import 'package:provider/provider.dart';
import 'screens/register.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(),
        ),
      ],
      child: MaterialApp(
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
          'register': (context) => Registration(),
          'login': (context) => Login(),
        },
        initialRoute: '/',
      ),
    );
  }
}
