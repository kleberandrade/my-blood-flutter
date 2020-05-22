import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/login/pages/sign_in_page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new SignInPage(),
      backgroundColor: Theme.of(context).primaryColor,
      loaderColor: Theme.of(context).canvasColor,
      photoSize: 75.0,
      image: Image.asset('lib/assets/logo.png', color: Colors.white),
      title: Text(
        'My Blood',
        style: TextStyle(
          fontSize: 32.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
