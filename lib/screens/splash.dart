import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movy_rek_app/model/local_storage.dart';
import 'package:movy_rek_app/model/user_info.dart';
import 'package:movy_rek_app/screens/activate_account.dart';
import 'package:movy_rek_app/screens/rating.dart';
import 'package:movy_rek_app/view_model/authentication_provider.dart';
import 'package:movy_rek_app/view_model/size_config.dart';
import 'package:movy_rek_app/view_model/userinfo_service.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isAuth = false;
  bool isActive = false;
  int ratings_count = 0;

  void runSecure() async {
    SecureStorage secureStorage = SecureStorage();
    String token = await secureStorage.getToken('token');
    if (token != null){//ksecureStorage.deleteAll();
      print("hhhhhh");
      print(token);
      UserInfo userInfo = await UserInfoApi().fetchData();
      isActive = userInfo.isActive;
      ratings_count = userInfo.ratings_count;
    }
    isAuth = token != null ? true : false;

  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1), () async {
        await runSecure();
        if (isAuth && isActive) { // when user auth and account active
          if (ratings_count == 0) { //check if user ratings list equal 0 go to RateMoviePage
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => RateMovie()));
          } else { // else go to HomePage
            Navigator.pushReplacement(
                context, new MaterialPageRoute(builder: (context) => Home()));
          }
        } else if (!isAuth) {//if user not auth(logged in) go to LoginPage
          Navigator.pushReplacement(
              context, new MaterialPageRoute(builder: (context) => Login()));
        } else {// else go to ActivateAccount
          Navigator.pushReplacement(context,
              new MaterialPageRoute(builder: (context) => ActivateAccount()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenticationProvider>(context,listen:false).initializePref();
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/temp.png',
                fit: BoxFit.fitHeight,
                width: SizeConfig.blockSizeVertical * 20,
                height: SizeConfig.blockSizeHorizontal * 20,
              ),
              Text(
                "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.all(5),
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
