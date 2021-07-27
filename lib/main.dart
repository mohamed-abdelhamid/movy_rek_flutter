import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movy_rek_app/screens/activate_account.dart';
import 'package:movy_rek_app/screens/category.dart';
import 'package:movy_rek_app/screens/edit_profile.dart';
import 'package:movy_rek_app/screens/home.dart';
import 'package:movy_rek_app/screens/profile.dart';
import 'package:movy_rek_app/screens/rating.dart';
import 'package:movy_rek_app/screens/search.dart';
import 'package:movy_rek_app/screens/splash.dart';
import 'package:movy_rek_app/screens/watch_list.dart';
import 'package:movy_rek_app/view_model/rate_movie_provider.dart';
import 'package:movy_rek_app/view_model/authentication_provider.dart';
import 'package:movy_rek_app/view_model/rate_provider.dart';

import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'view_model/category_provider.dart';
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
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<RateMovieProvider>(
          create: (_) => RateMovieProvider(),
        ),
        ChangeNotifierProvider<RateProvider>(
          create: (_) => RateProvider(),
        ),
      ],
      child: RefreshConfiguration(
        headerBuilder: () => WaterDropHeader(),
        // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
        footerBuilder: () => ClassicFooter(),
        // Configure default bottom indicator
        headerTriggerDistance: 80.0,
        // header trigger refresh trigger distance
        maxOverScrollExtent: 100,
        //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
        maxUnderScrollExtent: 0,
        // Maximum dragging range at the bottom
        enableScrollWhenRefreshCompleted: true,
        //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
        enableLoadingWhenFailed: true,
        //In the case of load failure, users can still trigger more loads by gesture pull-up.
        hideFooterWhenNotFull: false,
        // Disable pull-up to load more functionality when Viewport is less than one screen
        enableBallisticLoad: true,
        // trigger load more by BallisticScrollActivity
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
            '/': (context) => Splash(),
            '/Login': (context) => Login(),
            '/Rating': (context) => RateMovie(),
            '/Registration': (context) => Registration(),
            //'/': (context) => Registration(),
            '/Home': (context) => Home(),
            '/Search': (context) => SearchPage(),
            '/Category': (context) => CategoryPage(),
            '/Profile': (context) => ProfilePage(),
            '/Rate': (context) => RateMovie(),
            '/EditProfile': (context) => EditProfile(),
            '/WatchList': (context) => WatchList(),
            '/ActivateAccount': (context) =>  ActivateAccount(),
            //'/Movie': (context) => MoviePage(),
          },
          initialRoute: '/',
        ),
      ),
    );
  }
}
