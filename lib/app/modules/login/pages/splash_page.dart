import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/home/pages/home_page.dart';
import 'package:my_blood/app/modules/login/pages/sign_in_page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var home;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((res) {
      print(res);
      if (res != null) {
       setState(() {
         home = HomePage();
       }); 
      }
      else
      {
        setState(() {
         home = SignInPage();
       }); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 8,
      navigateAfterSeconds: home,
      backgroundColor: Theme.of(context).primaryColor,
      loaderColor: Colors.white,
      photoSize: 75.0,
      image: Image.asset('lib/assets/logo.png', color: Colors.white),
    );
  }
}
