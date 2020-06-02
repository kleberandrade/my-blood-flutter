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
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((res) {
      print(res);
      if (res != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
      else
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 8,
      //navigateAfterSeconds: user != null ? new HomePage() : new SignInPage(),
      backgroundColor: Theme.of(context).primaryColor,
      loaderColor: Theme.of(context).canvasColor,
      photoSize: 75.0,
      image: Image.asset('lib/assets/logo.png', color: Colors.white),
    );
  }
}
